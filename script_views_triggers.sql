use luderia;

#View Pessoa + Funcionário
create view PessoaFunc(cpf,ctps,nome,salario,rua,bairro,cidade,num) 
as (select p.cpf, ctps, nome, salario, rua, bairro, cidade, numero_casa 
	from pessoa p,funcionario f
    where p.cpf=f.cpf);

#View Pessoa + Cliente
create view PessoaCliente(cpf,rg,nome,telefone,rua,bairro,cidade,num) 
as (select p.cpf, rg, nome, telefone, rua, bairro, cidade, numero_casa 
	from pessoa p,cliente c
    where p.cpf=c.cpf);

#View Pessoa + Comanda + Jogo    
create view PessoaComanda(cpf_cliente, nome_cliente, cpf_funcionario, nome_funcionario,cod_jogo_alugado,nome_jogo,valor,data_hora_comanda)
as (select cpf_cliente,c.nome,cpf_funcionario,f.nome,cod_jogo_alugado,nome_jogo,valor,data_hora_comanda 
	from comanda inner join pessoa c on c.cpf = cpf_cliente
		 inner join pessoa f on f.cpf = cpf_funcionario
         left join jogo on cod_jogo_alugado = codigo_jogo);
    
#Trigger para inserir em Funcionário
delimiter //
create trigger insertFuncTrigger
before insert on funcionario
for each row
begin
	declare nc integer;
    set nc := (select count(*) from cliente c where c.cpf = new.cpf);
    if nc > 0 then
		signal sqlstate '45000' set message_text = 'O funcionário já está cadastrado como cliente!';
    end if;
end//

#Trigger para update em Funcionário
delimiter //
create trigger updateFuncTrigger
before update on funcionario
for each row
begin
	declare nc integer;
    set nc := (select count(*) from cliente c where c.cpf = new.cpf);
    if nc > 0 then
		signal sqlstate '45000' set message_text = 'O funcionário já está cadastrado como cliente!';
    end if;
end//

#Trigger para delete em Funcionário
delimiter //
create trigger deleteFuncTrigger
after delete on funcionario
for each row
begin
	delete from pessoa where pessoa.cpf = old.cpf;  
end//

#Trigger para inserir em Cliente
delimiter //
create trigger insertClienteTrigger
before insert on cliente
for each row
begin
	declare nf integer;
    set nf := (select count(*) from funcionario f where f.cpf = new.cpf);
    if nf > 0 then
		signal sqlstate '46000' set message_text = 'O cliente já está cadastrado como funcionário!';
    end if;
end//

#Trigger para update em Cliente
delimiter //
create trigger updateClienteTrigger
before update on cliente
for each row
begin
	declare nf integer;
    set nf := (select count(*) from funcionario f where f.cpf = new.cpf);
    if nf > 0 then
		signal sqlstate '46000' set message_text = 'O cliente já está cadastrado como funcionário!';
    end if;
end//

#Trigger para delete em Cliente
delimiter //
create trigger deleteClienteTrigger
after delete on cliente
for each row
begin
	delete from pessoa where pessoa.cpf = old.cpf;  
end//

#Trigger para insert em Comanda
delimiter //
create trigger insertComandaTrigger
before insert on comanda
for each row
begin
	declare loc boolean;
    declare nj integer;
	if not isnull(new.cod_jogo_alugado)  then
		set loc := (select locacao from jogo where codigo_jogo = new.cod_jogo_alugado);
        if loc = false then
			signal sqlstate '47000' set message_text = 'O jogo não está disponível para locação!';
        end if;
        set nj := (select count(*) from comanda where comanda.cod_jogo_alugado=new.cod_jogo_alugado);
        if nj > 0 then
			signal sqlstate '48000' set message_text = 'O jogo já está alugado!';
        end if;
    end if;
end//

#Trigger para update em Comanda
delimiter //
create trigger updateComandaTrigger
before update on comanda
for each row
begin
	declare loc boolean;
    declare nj integer;
	if not isnull(new.cod_jogo_alugado)  then
		set loc := (select locacao from jogo where codigo_jogo = new.cod_jogo_alugado);
        if loc = false then
			signal sqlstate '47000' set message_text = 'O jogo não está disponível para locação!';
        end if;
        set nj := (select count(*) from comanda where comanda.cod_jogo_alugado=new.cod_jogo_alugado);
        if nj > 0 and new.cod_jogo_alugado != old.cod_jogo_alugado then
			signal sqlstate '48350' set message_text = 'O jogo já está alugado!';
        end if;
    end if;
end//

#Trigger insert em comanda_compra_jogos
delimiter //
create trigger insertCompraJogosTrigger
before insert on comanda_compra_jogos
for each row
begin
	  declare disp boolean;
      declare preco decimal(6,2);
      set disp := (select em_estoque from jogo where codigo_jogo = new.codigo);
      if disp = false then
		signal sqlstate '49000' set message_text = 'O jogo não está em estoque!';
      else 
		set preco := (select preco_jogo from jogo where codigo_jogo = new.codigo);
		update comanda set valor = valor + new.quantidade*preco where comanda.cpf_cliente = new.cpf_cliente;
      end if;
end//

#Trigger delete em comanda_compra_jogos
delimiter //
create trigger deleteCompraJogosTrigger
before delete on comanda_compra_jogos
for each row
begin
	declare preco decimal(6,2);
	set preco := (select preco_jogo from jogo where codigo_jogo = old.codigo);
	update comanda set valor = valor - old.quantidade*preco where comanda.cpf_cliente = old.cpf_cliente;
end//

#Trigger insert em comanda_consome_itens
delimiter //
create trigger insertCompraItensTrigger
before insert on comanda_consome_itens
for each row
begin
	  declare disp boolean;
      declare preco decimal(6,2);
      set disp := (select em_estoque from itens_cardapio where codigo_item = new.codigo);
      if disp = false then
		signal sqlstate '49500' set message_text = 'O item não está em estoque!';
      else 
		set preco := (select preco_item from itens_cardapio where codigo_item = new.codigo);
		update comanda set valor = valor + new.quantidade*preco where comanda.cpf_cliente = new.cpf_cliente;
      end if;
end//

#Trigger delete em comanda_consome_itens
delimiter //
create trigger deleteCompraItensTrigger
before delete on comanda_consome_itens
for each row
begin
	declare preco decimal(6,2);
	set preco := (select preco_item from itens_cardapio where codigo_item = old.codigo);
	update comanda set valor = valor - old.quantidade*preco where comanda.cpf_cliente = old.cpf_cliente;
end//