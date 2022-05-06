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
INSERT INTO cliente VALUES (7892724, 'Pedro Farias', '1985-07-04');
/*						NUM_PATIO		RUA		CAPACIDADE.	*/
INSERT INTO patio VALUES (4, 'Rua do Agora', 5);
INSERT INTO patio VALUES (3, 'Rua do Ontem', 6);
INSERT INTO patio VALUES (1, 'Rua do Amanhã', 4);
INSERT INTO patio VALUES (9, 'Rua do Depois do Amanhã', 2);
/*							COD.MOD		DESCRIÇÃO */
INSERT INTO modelo VALUES (6, 'Volvo');
INSERT INTO modelo VALUES (5, 'BMW');
INSERT INTO modelo VALUES (9, 'Ferrari');
INSERT INTO modelo VALUES (7, 'Fusca');
/*							PLACA	M.C.Md	CPF.	COR*/
INSERT INTO veiculo VALUES ('JGB-7856', 6, 8595379,'Branco');
INSERT INTO veiculo VALUES ('KBZ-6055', 5, 2815749,'Preto');
INSERT INTO veiculo VALUES ('WPC-8752', 9, 4692972,'Cinza');
INSERT INTO veiculo VALUES ('JJJ-2020', 7, 7892724,'Verde');
/*								COD	PLACA		DTEntr.			DTSaid.		HrEnt.		Hr.Said.	*/
INSERT INTO estaciona VALUES (1, 4, 'JGB-7856', '20-02-2022', '20-02-2022', '07:20:30', '10:30:15');
INSERT INTO estaciona VALUES (2, 3, 'KBZ-6055', '15-03-2022', '16-03-2022', '10:20:30', '11:30:15');
INSERT INTO estaciona VALUES (3, 1, 'WPC-8752', '09-04-2022', '09-04-2022', '09:10:00', '09:09:10');
INSERT INTO estaciona VALUES (4, 9, 'JJJ-2020', '12-05-2022', '13-05-2022', '13:15:00', '17:12:12');

/*Exiba o CPF e o NOME dos CLIENTES que possuem os veículos com PLACA terminadas com ‘0’. */
SELECT p.placa,
		f.nome
FROM veiculo p
INNER JOIN cliente f
ON (p.cliente_cpf = f.cpf)
WHERE (p.placa LIKE '%0');

/*Exiba o CPF e o Nome dos clientes que possuem os veículos com placa terminadas com ‘0’*/
SELECT DISTINCT placa, cliente_cpf FROM veiculo WHERE placa LIKE '%0';

/*Exiba a placa e a cor do veículo que possui o código de estacionamento 1.*/
SELECT v.placa,
		v.cor
FROM veiculo v INNER JOIN estaciona e
ON (e.veiculo_placa = v.placa)
WHERE e.cod = 1;

/*Liste as placas e os nomes dos proprietários dos veículos*/
SELECT p.placa,
		n.nome
FROM veiculo p INNER JOIN cliente n
ON p.cliente_cpf = n.cpf;

/*Liste todos os estacionamentos do veículo de placa “JJJ-2020*/
SELECT cod FROM estaciona WHERE veiculo_placa LIKE 'JJJ-2020';

/*Exiba o endereço, a data de entrada e de saída dos estacionamentos dos veículos terminados em “6”*/
SELECT e.ender,
		d.dtEntrada,
		d.dtSaida
FROM patio e INNER JOIN estaciona d
ON e.num = d.patio_num
WHERE d.veiculo_placa LIKE '%6';

/*Liste as placas, os horários de entrada e saída dos veículos de cor vermelha*/
SELECT p.placa,
	h.hsEntrada,
	h.hsSaida
FROM veiculo p INNER JOIN estaciona h
ON p.placa = h.veiculo_placa
WHERE p.cor = 'Branco'

/* Exiba a quantidade de vezes os veículos de cor verde estacionaram */
SELECT count(x.cod)
FROM veiculo v INNER JOIN estaciona x
ON v.placa = x.veiculo_placa
WHERE v.cor = 'Verde';

/*Exiba a placa, o nome dos donos e a descrição dos os modelos de todos os veículos*/
SELECT p.placa,
	n.nome,
	d.desc_2
FROM veiculo p INNER JOIN cliente n
ON p.cliente_cpf = n.cpf
INNER JOIN modelo d
ON d.codMod = p.modelo_codMod