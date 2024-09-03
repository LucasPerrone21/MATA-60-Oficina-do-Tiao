CREATE TABLE tbl_cargos (
    cp_id_cargo SERIAL PRIMARY KEY UNIQUE,
    nm_cargo VARCHAR(60),
    salario_base DECIMAL(10,2),
    adicional_cliente DECIMAL(10,2)
);

CREATE TABLE tbl_funcionarios (
    cp_id_func SERIAL PRIMARY KEY UNIQUE,
    ce_id_cargo INTEGER NOT NULL REFERENCES tbl_cargos(cp_id_cargo) ON DELETE CASCADE,
    nm_func VARCHAR(60) NOT NULL,
    cpf_func VARCHAR(20) NOT NULL,
    tel_func VARCHAR(20),
    email_func VARCHAR(60)
);

CREATE TABLE tbl_clientes (
    cp_id_cliente SERIAL PRIMARY KEY UNIQUE,
    nm_cliente VARCHAR(60) NOT NULL,
    cpf_cliente VARCHAR(20) NOT NULL,
    tel_cliente VARCHAR(20),
    email_cliente VARCHAR(60)
);

CREATE TABLE tbl_veiculos (
    cp_id_veiculo SERIAL PRIMARY KEY UNIQUE,
    marca_veiculo VARCHAR(60),
    modelo_veiculo VARCHAR(60),
    ano_veiculo DATE,
    placa_veiculo VARCHAR(20),
    ce_id_cliente INTEGER NOT NULL REFERENCES tbl_clientes(cp_id_cliente) ON DELETE CASCADE
);

CREATE TABLE tbl_mao_de_obra (
    cp_id_mao_obra SERIAL PRIMARY KEY UNIQUE,
    preco_servico DECIMAL(10,2),
    desc_servico VARCHAR(200),
    nm_servico VARCHAR(60)
);

CREATE TABLE tbl_fornecedores (
    cp_id_forn SERIAL PRIMARY KEY UNIQUE,
    nm_forn VARCHAR(60),
    cnpj_forn VARCHAR(20),
    endereco_forn VARCHAR(200)
);

CREATE TABLE tbl_pecas (
    cp_id_peca SERIAL PRIMARY KEY UNIQUE,
    data_compra DATE,
    ce_id_fornecedor INTEGER NOT NULL REFERENCES tbl_fornecedores(cp_id_forn) ON DELETE CASCADE,
    ind_venda BOOLEAN,
    nm_peca VARCHAR(60),
    preco_peca DECIMAL(10,2)
);

CREATE TABLE tbl_ordem_servicos (
    cp_id_ord_serv SERIAL PRIMARY KEY UNIQUE,
    ce_id_veiculo INTEGER NOT NULL REFERENCES tbl_veiculos(cp_id_veiculo) ON DELETE CASCADE,
    data_inicio DATE,
  	data_entrega DATE,
  	text_descricao VARCHAR(500)
);

CREATE TABLE tbl_pecas_usadas(
    cp_id_peca SERIAL PRIMARY KEY UNIQUE,
    ce_id_estoque_peca INTEGER NOT NULL REFERENCES tbl_pecas(cp_id_peca),
    data_venda DATE,
    ce_ordem_servico INTEGER NOT NULL REFERENCES tbl_ordem_servicos(cp_id_ord_serv)
);


CREATE TABLE tbl_responsaveis_manutencao (
  	cp_id_responsaveis SERIAL PRIMARY KEY UNIQUE,
    ce_id_func INTEGER NOT NULL REFERENCES tbl_funcionarios(cp_id_func),
    ce_id_ord_serv INTEGER NOT NULL REFERENCES tbl_ordem_servicos(cp_id_ord_serv),
  	nm_status VARCHAR(20)
);
 
CREATE TABLE tbl_trabalhos_realizados(
    cp_id_trabalhos SERIAL PRIMARY KEY NOT NULL UNIQUE,
    ce_id_ord_serv INTEGER NOT NULL REFERENCES tbl_ordem_servicos(cp_id_ord_serv),
    ce_id_mao_obra INTEGER NOT NULL REFERENCES tbl_mao_de_obra(cp_id_mao_obra),
    text_observacoes VARCHAR(500)
);