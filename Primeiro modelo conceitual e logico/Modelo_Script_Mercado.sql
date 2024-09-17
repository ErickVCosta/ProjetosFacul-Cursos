-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE produto (
preco DECIMAL(10,2),
desconto DECIMAL(10,2),
estoque INTEGER,
imagem VARCHAR(255),
descricao VARCHAR(255),
preco_custo DECIMAL(10,2),
id_prod INTEGER PRIMARY KEY,
nome_prod VARCHAR(255),
id_etq INTEGER
)

CREATE TABLE estoque (
id_etq INTEGER PRIMARY KEY,
qntd INTEGER,
id_fornecedor INTEGER
)

CREATE TABLE fornecedor (
cnpj VARCHAR(25),
contato VARCHAR(250),
numero VARCHAR(25),
bairro VARCHAR(250),
cep VARCHAR(25),
rua VARCHAR(250),
cidade VARCHAR(250),
estado VARCHAR(250),
id_fornecedor INTEGER PRIMARY KEY
)

CREATE TABLE venda (
data_venda DATETIME,
valor_total DECIMAL(10,2),
dinheiro DECIMAL(10,2),
debito DECIMAL(10,2),
parcelas INTEGER,
cpf_client VARCHAR(11),
id_venda INTEGER PRIMARY KEY,
id_func INTEGER,
id_client INTEGER
)

CREATE TABLE cliente (
rua VARCHAR(250),
numero VARCHAR(25),
cep VARCHAR(25),
bairro VARCHAR(100),
cidade VARCHAR(50),
estado VARCHAR(50),
nome_client VARCHAR(100),
id_client INTEGER PRIMARY KEY,
cpf_client VARCHAR(25),
data_nasc_client VARCHAR(25)
)

CREATE TABLE funcionario (
cargo VARCHAR(255),
rua VARCHAR(25),
numero VARCHAR(25),
cidade VARCHAR(255),
cep VARCHAR(8),
bairro VARCHAR(255),
nome_func VARCHAR(100),
cpf_func VARCHAR(11),
salario DECIMAL(10,2),
id_func INTEGER PRIMARY KEY,
data_nasc_func VARCHAR(25),
data_adms VARCHAR(25),
login_senha VARCHAR(255)
)

CREATE TABLE marca (
marca_PK INTEGER PRIMARY KEY,
marca VARCHAR(10)
)

CREATE TABLE data_val_1 (
data_val_PK DATETIME PRIMARY KEY,
data_val DATETIME
)

CREATE TABLE categoria (
categoria_PK VARCHAR(250) PRIMARY KEY,
categoria VARCHAR(250)
)

CREATE TABLE fornecedor_1 (
fornecedor_PK INTEGER PRIMARY KEY,
fornecedor VARCHAR(250),
id_prod_FK INTEGER,
FOREIGN KEY(id_prod_FK) REFERENCES produto (id_prod)
)

CREATE TABLE id_prod (
id_prod_PK INTEGER PRIMARY KEY,
id_prod INTEGER
)

CREATE TABLE data_val (
data_val_PK DATETIME PRIMARY KEY,
data_val DATETIME
)

CREATE TABLE lote (
lote_PK INTEGER PRIMARY KEY,
lote INTEGER
)

CREATE TABLE data_entr (
data_entr_PK INTEGER PRIMARY KEY,
data_entr VARCHAR(10),
id_etq_FK INTEGER,
FOREIGN KEY(id_etq_FK) REFERENCES estoque (id_etq)
)

CREATE TABLE nome_fornecedor (
nome_fornecedor_PK INTEGER PRIMARY KEY,
nome_fornecedor VARCHAR(250)
)

CREATE TABLE telefone (
telefone_PK INTEGER PRIMARY KEY,
telefone VARCHAR(20)
)

CREATE TABLE email_fornecedor (
email_fornecedor_PK VARCHAR(250) PRIMARY KEY,
email_fornecedor VARCHAR(250),
id_fornecedor_FK INTEGER,
FOREIGN KEY(id_fornecedor_FK) REFERENCES fornecedor (id_fornecedor)
)

CREATE TABLE itens_comprados (
itens_comprados_PK INTEGER PRIMARY KEY,
itens_comprados VARCHAR(10),
id_venda_FK INTEGER,
FOREIGN KEY(id_venda_FK) REFERENCES venda (id_venda)
)

CREATE TABLE hist_compra (
hist_compra_PK INTEGER PRIMARY KEY,
hist_compra VARCHAR(10)
)

CREATE TABLE email (
email_PK VARCHAR(250) PRIMARY KEY,
email VARCHAR(250)
)

CREATE TABLE pref_prod (
pref_prod_PK VARCHAR(250) PRIMARY KEY,
pref_prod VARCHAR(250)
)

CREATE TABLE telefone_client (
telefone_client_PK INTEGER PRIMARY KEY,
telefone_client VARCHAR(10),
id_client_FK INTEGER,
FOREIGN KEY(id_client_FK) REFERENCES cliente (id_client)
)

CREATE TABLE telefone_func (
telefone_func_PK VARCHAR(11) PRIMARY KEY,
telefone_func VARCHAR(11),
id_func_FK INTEGER,
FOREIGN KEY(id_func_FK) REFERENCES funcionario (id_func)
)

CREATE TABLE prod_fornecedor (
id_prod INTEGER,
id_fornecedor INTEGER,
FOREIGN KEY(id_prod) REFERENCES produto (id_prod),
FOREIGN KEY(id_fornecedor) REFERENCES fornecedor (id_fornecedor)
)

CREATE TABLE venda_prod (
id_prod INTEGER,
id_venda INTEGER,
FOREIGN KEY(id_prod) REFERENCES produto (id_prod),
FOREIGN KEY(id_venda) REFERENCES venda (id_venda)
)

ALTER TABLE produto ADD FOREIGN KEY(id_etq) REFERENCES estoque (id_etq)
ALTER TABLE estoque ADD FOREIGN KEY(id_fornecedor) REFERENCES fornecedor (id_fornecedor)
ALTER TABLE venda ADD FOREIGN KEY(id_func) REFERENCES funcionario (id_func)
ALTER TABLE venda ADD FOREIGN KEY(id_client) REFERENCES cliente (id_client)
