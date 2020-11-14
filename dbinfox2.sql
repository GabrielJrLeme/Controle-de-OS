CREATE DATABASE dbinfox;

USE dbinfox;

/*--------------------------------------------TABELA DE USUARIOS-----------------*/

CREATE TABLE tbsuarios(
iduser		INT 			PRIMARY KEY,
usuario 	VARCHAR(50)		NOT NULL,
fone		VARCHAR(15) 	NULL,
login		VARCHAR(15) 	NOT NULL UNIQUE,
senha		VARCHAR(15)		NOT NULL
);
-- Mostra os campos da tabela
DESCRIBE tbsuarios;

-- Mostra os dados da tabela
SELECT * FROM tbsuarios;

-- Seleciona somente os usuarios com login admin e senha admin
SELECT * FROM tbsuarios WHERE login = 'admin' AND senha = 'admin';

-- inserindo novo campo na tabela
ALTER TABLE tbsuarios ADD COLUMN perfil VARCHAR(20) NOT NULL;

-- Removendo um campo da tabela
ALTER TABLE tbsuarios DROP COLUMN  perfil;

-- insere os dados no campo perfil
UPDATE tbsuarios SET perfil = 'user' WHERE iduser = 5;

INSERT INTO tbsuarios(iduser,usuario,fone,login,senha) VALUES (1,'Gabriel','98800-2950','junior',123);
INSERT INTO tbsuarios(iduser,usuario,fone,login,senha) VALUES (2,'Luiza','92345-2950','Ranieri',124);
INSERT INTO tbsuarios(iduser,usuario,fone,login,senha) VALUES (3,'Admin','98800-4352','admin','admin');
INSERT INTO tbsuarios(iduser,usuario,fone,login,senha) VALUES (4,'Sandro','98970-5252','sandro','543');
INSERT INTO tbsuarios(iduser,usuario,fone,login,senha) VALUES (5,'User','90485-5252','user','user');


/*------------------------------------------TABELA DE CLIENTES---------------------------------------*/

CREATE TABLE tbclientes(
idclientes 		INT 			PRIMARY KEY 	AUTO_INCREMENT,
nomcliente 		VARCHAR(50) 	NOT NULL				      ,
endcli			VARCHAR(100)			                      ,
fonecli			VARCHAR(50)		NOT NULL                      ,
emailcli		VARCHAR(50)				
);

DESCRIBE tbclientes;
SELECT * FROM tbclientes;

INSERT INTO tbclientes(nomcliente,endcli,fonecli,emailcli) VALUES('Paulao do gas','rua das maconhas','3333-9080','gas_do_paulao@gmial.com.br');

/*------------------------------------------------TABELA DE ORDEM DE SERVIÇO----------------------*/

CREATE TABLE TBOS(
os				INT 			PRIMARY KEY 		AUTO_INCREMENT   ,
data_os			TIMESTAMP 		DEFAULT				CURRENT_TIMESTAMP,
equipamento		VARCHAR(150)	NOT NULL                             ,
defeito			VARCHAR(150)	NOT NULL                             ,
servico			VARCHAR(150) 	NOT NULL                             ,
tecnico			VARCHAR(30)                                          ,
valor			DECIMAL(10,2)                                        ,
idcli			INT 			NOT NULL                             ,	
FOREIGN KEY(idcli) REFERENCES tbclientes(idclientes)
);

DESCRIBE TBOS;
SELECT * FROM TBOS;

INSERT INTO TBOS(equipamento,defeito,servico,tecnico,valor,idcli) 
VALUES('notbook','nao liga','troca da fonte','maruinhos',150.00,1);


SELECT
O.os,equipamento,defeito,servico,valor,C.nomcliente,fonecli
FROM TBOS as O
INNER JOIN tbclientes AS C
ON (O.idcli = C.idclientes);

