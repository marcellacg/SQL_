CREATE TABLE cliente 
( 
 cod INT PRIMARY KEY,
 nome VARCHAR(100),  
 email VARCHAR(80) 
); 

CREATE TABLE localizacao 
( 
 cod INT PRIMARY KEY,
 rua VARCHAR(80),  
 bairro VARCHAR(50),  
 telefone INT  
); 

CREATE TABLE localizacaoCliente 
( 
 cod INT PRIMARY KEY,
 rua VARCHAR(200),  
 bairro VARCHAR(50),  
 telefone INT,  
 idCliente INT,
 FOREIGN KEY(idCliente) REFERENCES cliente
); 

CREATE TABLE restaurante 
( 
 idRestaurante INT GENERATED ALWAYS AS IDENTITY,
 cnpj VARCHAR(20) NOT NULL,
 nome CHAR(100),   
 idLocalizacao INT,
 PRIMARY KEY(idRestaurante),
 FOREIGN KEY(idLocalizacao) REFERENCES localizacao
); 

CREATE TABLE funcionario 
( 
 matricula INT PRIMARY KEY,
 idRestaurante INT,  
 cpf CHAR(14) NOT NULL,  
 endereco VARCHAR(200),  
 nome VARCHAR(100),  
 funcao VARCHAR(20),
 FOREIGN KEY(idRestaurante) REFERENCES restaurante
); 

CREATE TABLE garcom 
( 
 idFuncionario INT PRIMARY KEY,
 FOREIGN KEY(idFuncionario) REFERENCES funcionario
);

CREATE TABLE entregador 
( 
 idFuncionario INT PRIMARY KEY,
 FOREIGN KEY(idFuncionario) REFERENCES funcionario
);

CREATE TABLE pedido 
(
 Cod INT PRIMARY KEY,
 idGarcom INT,  
 idEntregador INT,  
 idCliente INT,  
 valor FLOAT,  
 especificacoes VARCHAR(200),  
 idLocalizacaoCliente INT,
 FOREIGN KEY(idEntregador) REFERENCES entregador,
 FOREIGN KEY(idGarcom) REFERENCES garcom,
 FOREIGN KEY(idCliente) REFERENCES cliente,
 FOREIGN KEY(idLocalizacaoCliente) REFERENCES localizacaoCliente
); 

CREATE TABLE mesa 
( 
 cod INT PRIMARY KEY,
 idReserva INT,  
 idPedido INT
); 


CREATE TABLE reserva 
(
 cod INT PRIMARY KEY,
 data CHAR(10),  
 idCliente INT,  
 idMesa INT,
 FOREIGN KEY(idCliente) REFERENCES cliente,
 FOREIGN KEY(idMesa) REFERENCES mesa
); 

 ALTER TABLE mesa ADD FOREIGN KEY (idReserva) REFERENCES reserva;
 ALTER TABLE mesa ADD FOREIGN KEY (idPedido) REFERENCES pedido;
 

CREATE TABLE categoria 
(
 cod INT PRIMARY KEY,
 refrigerante VARCHAR(30),  
 doces VARCHAR(30),  
 massas VARCHAR(50)  
); 

CREATE TABLE produto 
(
 cod INT PRIMARY KEY,
 idRestaurante INT,  
 idCategoria INT,
 FOREIGN KEY(idRestaurante) REFERENCES restaurante,
 FOREIGN KEY(idCategoria) REFERENCES categoria
); 

CREATE TABLE itemPedido 
(
 idProduto INT PRIMARY KEY, 
 quantidade INT, 
 idPedido INT,
 FOREIGN KEY(idProduto) REFERENCES produto,
 FOREIGN KEY(idPedido) REFERENCES pedido
); 

SELECT * FROM cliente;

INSERT INTO cliente(
	cod, nome, email)
	VALUES (2, 'Joao', 'joao.com');
