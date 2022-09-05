/* Lógico: */

CREATE TABLE destino (
    id_destino int not null PRIMARY KEY,
    cidade_destino varchar(20) not null,
    estado_destino varchar(20) not null,
    pais_destino varchar(20) not null,
    valor_destino float not null,
    ida_destino date not null,
    volta_destino date null,
    nome_destino varchar(40) not null
);

CREATE TABLE promocoes (
    ida_promocoes date not null,
    valor_promocoes float not null,
    id_promocoes int not null PRIMARY KEY,
    volta_promocoes date not null,
    nome_promocao varhar(40) not null,
    fk_destino_id_destino int not null,
    fk_hoteis_id_hotel int not null
);

CREATE TABLE hoteis (
    valor_hotel float not null,
    pais_hotel varchar(20) not null,
    estado_hotel varchar(20) not null,
    cidade_hotel varchar(40) not null,
    id_hotel int not null PRIMARY KEY,
    ida_hotel data not null,
    volta_hotel date null,
    nome_hotel varchar(20) not null
);
 
ALTER TABLE promocoes ADD CONSTRAINT FK_promocoes_2
    FOREIGN KEY (fk_destino_id_destino)
    REFERENCES destino (id_destino)
    ON DELETE CASCADE;
 
ALTER TABLE promocoes ADD CONSTRAINT FK_promocoes_3
    FOREIGN KEY (fk_hoteis_id_hotel)
    REFERENCES hoteis (id_hotel)
    ON DELETE CASCADE;CREATE DATABASE IF NOT EXISTS vayvem;
USE vayvem;
CREATE TABLE passagem (
    id_p int not null auto_increment PRIMARY KEY,
    cidade_destino varchar(20) not null,
    estado_destino varchar(20) not null,
    pais_destino varchar(20) not null,
    valor_destino float not null,
    ida_destino date not null,
    volta_destino date null,
    nome_destino varchar(40) not null,
    fk_cliente_cpf varchar(15) not null
);

CREATE TABLE pacote (
    id_pct int not null auto_increment PRIMARY KEY,
    ida_pct date not null,
    desconto float not null,
    volta_pct date not null,
    nome_pct varchar(40) not null,
    fk_passagem_id_p int not null,
    fk_hospedagem_id_h int not null
);

CREATE TABLE hospedagem (
    id_h int not null auto_increment PRIMARY KEY,
    valor_h float not null,
    pais_h varchar(20) not null,
    estado_h varchar(20) not null,
    cidade_h varchar(40) not null,
    check_in date not null,
    check_out date not null,
    nome_hotel varchar(20) not null,
    fk_cliente_cpf varchar(15) not null
);

CREATE TABLE cliente (
    cpf varchar(15) not null PRIMARY KEY,
    sobrenome varchar(40) not null,
    rua varchar(40) not null,
    bairro varchar(40) not null,
    cep varchar(40) not null,
    cidade_c varchar(40) not null,
    estado_c varchar(40) not null,
    email varchar(40) not null unique,
    numero int not null,
    nome varchar(40) not null,
    fk_pacote_id_pct int not null
);
 
ALTER TABLE passagem ADD CONSTRAINT FK_passagem_2
    FOREIGN KEY (fk_cliente_cpf)
    REFERENCES cliente (cpf)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
 
ALTER TABLE pacote ADD CONSTRAINT FK_pacote_2
    FOREIGN KEY (fk_passagem_id_p)
    REFERENCES passagem (id_p)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
 
ALTER TABLE pacote ADD CONSTRAINT FK_pacote_3
    FOREIGN KEY (fk_hospedagem_id_h)
    REFERENCES hospedagem (id_h)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
 
ALTER TABLE hospedagem ADD CONSTRAINT FK_hospedagem_2
    FOREIGN KEY (fk_cliente_cpf)
    REFERENCES cliente (cpf)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
 
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_2
    FOREIGN KEY (fk_pacote_id_pct)
    REFERENCES pacote (id_pct)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;