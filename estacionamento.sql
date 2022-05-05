CREATE TABLE cliente (
	cpf int PRIMARY KEY,
	nome varchar(60),
	dtNasc DATE
);

CREATE TABLE modelo (
	codMod int PRIMARY KEY,
	desc_2 varchar(40)
);

CREATE TABLE veiculo (
	placa varchar(8) PRIMARY KEY,
	modelo_codMod int REFERENCES modelo (codMod),
	cliente_cpf int REFERENCES cliente (cpf),
	cor varchar(20)
);

CREATE TABLE patio (
	num int PRIMARY KEY,
	ender varchar(40),
	capacidade int
);

CREATE TABLE estaciona (
	cod int PRIMARY KEY,
	patio_num int REFERENCES patio (num),
	veiculo_placa varchar(8) REFERENCES veiculo (placa),
	dtEntrada varchar(10),
	dtSaida varchar(10),
	hsEntrada varchar(10),
	hsSaida varchar(10)
);

/*							CPF		NOME				DATA NASC.	*/
INSERT INTO cliente VALUES (8595379, 'Maria da Silva', '1987-02-12');
INSERT INTO cliente VALUES (2815749, 'José Fonseca', '1970-03-10');
INSERT INTO cliente VALUES (4692972, 'Julia Martins', '1977-04-16');
/*							NUM		RUA		CAPACIDADE.	*/
INSERT INTO patio VALUES (4, 'Rua do Agora', 5);
INSERT INTO patio VALUES (3, 'Rua do Ontem', 6);
INSERT INTO patio VALUES (1, 'Rua do Amanhã', 4);
/*							COD.MOD		DESCRIÇÃO */
INSERT INTO modelo VALUES (6, 'Volvo');
INSERT INTO modelo VALUES (5, 'BMW');
INSERT INTO modelo VALUES (9, 'Ferrari');
/*							PLACA	M.C.Md	CPF.	COR*/
INSERT INTO veiculo VALUES ('JGB-7856', 6, 8595379,'Branco');
INSERT INTO veiculo VALUES ('KBZ-6055', 5, 2815749,'Preto');
INSERT INTO veiculo VALUES ('WPC-8752', 9, 4692972,'Cinza');
/*								COD	PLACA		DTEntr.			DTSaid.		HrEnt.		Hr.Said.	*/
INSERT INTO estaciona VALUES (1, 4, 'JGB-7856', '20-02-2022', '20-02-2022', '07:20:30', '10:30:15');
INSERT INTO estaciona VALUES (2, 3, 'KBZ-6055', '15-03-2022', '16-03-2022', '10:20:30', '11:30:15');
INSERT INTO estaciona VALUES (3, 1, 'WPC-8752', '09-04-2022', '09-04-2022', '09:10:00', '09:09:10');

SELECT * FROM cliente;
SELECT placa, nome FROM veiculo, cliente;
SELECT placa, cliente_cpf FROM veiculo WHERE placa LIKE '%5';
SELECT placa FROM veiculo WHERE modelo_codMod = 6;
SELECT ender FROM patio, estaciona WHERE veiculo_placa LIKE '%6';
