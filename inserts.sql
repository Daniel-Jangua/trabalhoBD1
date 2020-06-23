use luderia;

insert into pessoa(cpf,nome, rua, bairro, cidade, numero_casa)
values
(12121212121, 'Luccas Carlos', 'Rua 1', 'Centro', 'Bauru', 125),
(13131313131, 'João Menezes', 'Rua 4', 'Centro', 'Bauru', 450),
(14141414141, 'Marcela Ribeiro', 'Rua 5', 'Colonial', 'Bauru', 331),
(15151515151, 'Júlio Henrique', 'Rua 2', 'Vila Universitária', 'Bauru', 120),
(45200790808, 'Daniel Jangua', 'Fioravante Pissuto', 'Colonial', 'Bauru', 212),
(11111111111, 'Jorge Martins', 'Rua 1', 'Centro', 'São Carlos', 1452),
(16161616161, 'Luccas Passos', 'Rua 1', 'Centro', 'São Carlos', 1476),
(10101010101, 'Denis Medeiros', 'Rua 7', 'Colonial', 'Bauru', 1254),
(17171717171, 'Lucas Parma', 'Rua 5', 'Centro', 'Bauru', 451),
(18181818181, 'Júlio Trancou', 'Rua 8', 'Vila Universitária', 'Bauru',1200);

insert into funcionario(cpf,ctps,salario)
values
(45200790808, 4520079000, 1200.00),
(17171717171, 1717171000, 1200.00),
(18181818181, 1818181000, 900.00);

insert into cliente(cpf,rg,telefone)
values
(12121212121, 121212121, '22222222'),
(13131313131, 131313131, '33333333'),
(14141414141, 141414141, '44444444'),
(15151515151, 151515151, '55555555'),
(11111111111, 111111111, '11111111'),
(16161616161, 161616161, '66666666'),
(10101010101, 101010101, '00000000');

insert into jogo(codigo_jogo, descricao_jogo,nome_jogo,preco_jogo,em_estoque,locacao)
values
(000000000, 'Estratégia, Guerra, Dominação', 'War', 50.00, true, false),
(111111111, 'Dinheiro, Finanças, Banco', 'Banco Imobiliário', 45.00, false, true),
(222222222, 'Detetive, Estratégia, Mistério', 'Detetive', 30.00, true, true),
(333333333, 'Simulador, Real, Estratégia', 'Jogo da Vida', 55.00, true, true),
(444444444, 'Adivinhação, Desenho, Mímica', 'Imagem e Ação', 50.00, false, false);

insert into itens_cardapio(codigo_item, descricao_item, em_estoque, nome_item, preco_item)
values
(555555555, 'Lata 350ml', true, 'Coca-Cola', 4.50),
(666666666, 'Lata 350ml', false, 'Pepsi', 4.00),
(777777777, 'Presunto e Queijo', true, 'Salgado', 5.00),
(888888888, 'Sabor nacho', true, 'Doritos', 3.50),
(999999999, 'Água mineral sem gás 500ml', true, 'Água', 2.00);

