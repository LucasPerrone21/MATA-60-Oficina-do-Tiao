CREATE INDEX idx_veiculos_cliente ON tbl_veiculos (ce_id_cliente);
CREATE INDEX idx_responsaveis_ord_func ON tbl_responsaveis_manutencao (ce_id_ord_serv, ce_id_func);
CREATE INDEX idx_ordem_servicos_veiculo ON tbl_ordem_servicos (ce_id_veiculo);
CREATE INDEX idx_clientes_cpf_hash ON tbl_clientes USING HASH (cpf_cliente);


