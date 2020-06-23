#---cria o BD Luderia------------
create database Luderia;
#----comando para usar a database do BD luderia
use luderia;
#------Tabela_Pessoa----------
create table pessoa (
	cpf bigint(11) primary key,
    nome varchar(64) not null,
    rua varchar(32),
    bairro varchar(32),
    cidade varchar(32) default 'Bauru',
    numero_casa integer
);
#-----Tabela_Funcionario---------
create table funcionario(
	cpf bigint(11) primary key,
    salario decimal(7,2) not null,
    ctps bigint(10) not null unique,
    constraint cpf_funcionario_FK foreign key(cpf) references pessoa(cpf)
);
#------Tabela_cliente---------------
create table cliente(
	cpf bigint(11) primary key,
    rg integer(9) not null unique,
    telefone varchar(12) not null,
    constraint cpf_cliente_FK foreign key(cpf) references pessoa(cpf)
);
#--------Tabela_Itens_Cardapio---------------
create table itens_cardapio(
	codigo_item integer(9) primary key,
    descricao_item varchar(128),
    em_estoque boolean not null default 1,
    nome_item varchar(30) not null,
    preco_item decimal(5,2) not null
);
#-------Tabela_Jogo--------------------------
create table jogo(
	codigo_jogo integer(9) primary key,
    descricao_jogo varchar(256),
    nome_jogo varchar(30) not null unique,
    preco_jogo decimal(6,2),
    em_estoque boolean not null default 1,
    locacao boolean not null default 0
);
#-------Tabela_Comanda--------------
create table comanda(
	cpf_cliente bigint(11) primary key,
    cpf_funcionario bigint(11) not null,
    data_hora_comanda datetime not null default current_timestamp,
    cod_jogo_alugado integer(9), 
    valor decimal(6,2) default 15.00,
    constraint cpfFunc_comanda_FK foreign key(cpf_funcionario) references funcionario(cpf),
    constraint cpfCliente_comanda_FK foreign key(cpf_cliente) references cliente(cpf),
    constraint codJogo_comanda_FK foreign key(cod_jogo_alugado) references jogo(codigo_jogo)
);
#--------Tabela_Comanda_Compra_Jogos-------
create table comanda_compra_jogos(
	cpf_cliente bigint(11),
    codigo integer(9),
    quantidade integer not null default 1,
    constraint cpfCliente_comandaJogos_FK foreign key(cpf_cliente) references comanda(cpf_cliente),
    constraint cod_jogosVenda_FK foreign key(codigo) references jogo(codigo_jogo),
    primary key(cpf_cliente, codigo)
);
#--------Tabela_Comanda_Consome_Itens-------
create table comanda_consome_itens(
	cpf_cliente bigint(11),
    codigo integer(9),
    quantidade integer not null default 1,
	constraint cpfCliente_comandaItens_FK foreign key(cpf_cliente) references comanda(cpf_cliente),
    constraint cod_itensVenda_FK foreign key(codigo) references itens_cardapio(codigo_item),
    primary key(cpf_cliente, codigo)
);