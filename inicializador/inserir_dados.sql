PRAGMA foreign_keys = ON;

INSERT INTO Cliente (nome, cpf, telefone, email, endereco) VALUES
('Ana Souza',      '111.111.111-11', '(67) 99111-1111', 'ana.souza@email.com',   'Rua das Flores, 100 - Campo Grande/MS'),
('Bruno Lima',     '222.222.222-22', '(67) 99222-2222', 'bruno.lima@email.com',  'Av. Afonso Pena, 2000 - Campo Grande/MS'),
('Carla Mendes',   '333.333.333-33', '(67) 99333-3333', 'carla.mendes@email.com','Rua Bahia, 45 - Campo Grande/MS'),
('Diego Alves',    '444.444.444-44', '(67) 99444-4444', 'diego.alves@email.com', 'Rua 14 de Julho, 780 - Campo Grande/MS'),
('Elisa Prado',    '555.555.555-55', '(67) 99555-5555', 'elisa.prado@email.com', 'Rua Ceará, 330 - Campo Grande/MS');

INSERT INTO Equipamento (id_cliente, tipo, marca, modelo, numero_serie, observacoes) VALUES
(1, 'Notebook',   'Dell',   'Inspiron 15',   'SN-DELL-0001', 'Arranhões na tampa'),
(2, 'Computador', 'Positivo','Master D3400',  'SN-POS-0002',  'Sem fonte original'),
(3, 'Notebook',   'Lenovo', 'IdeaPad 3',     'SN-LEN-0003',  'Tela trincada no canto'),
(4, 'Notebook',   'Acer',   'Aspire 5',      'SN-ACE-0004',  NULL),
(1, 'Computador', 'Dell',   'OptiPlex 3080', 'SN-DELL-0005', 'Cliente Ana possui 2 equipamentos');

INSERT INTO Tecnico (nome, cpf, telefone, especialidade, data_admissao) VALUES
('Fernando Costa', '666.666.666-66', '(67) 98111-0001', 'Hardware',        '2022-03-10'),
('Gabriela Rocha', '777.777.777-77', '(67) 98111-0002', 'Software/SO',     '2023-07-01'),
('Henrique Dias',  '888.888.888-88', '(67) 98111-0003', 'Redes',           '2021-11-15'),
('Isabela Nunes',  '999.999.999-99', '(67) 98111-0004', 'Telas e Placas',  '2024-02-20'),
('João Pedro',     '123.456.789-00', '(67) 98111-0005', 'Recuperação de dados','2020-05-05');

INSERT INTO Peca (descricao, fabricante, codigo_interno, quantidade_estoque, valor_unitario) VALUES
('SSD 480GB SATA',       'Kingston', 'PC-001', 15,  229.90),
('Memória RAM 8GB DDR4', 'Crucial',  'PC-002', 20,  189.00),
('Bateria Notebook',     'Genérica', 'PC-003',  8,  159.50),
('Tela LCD 15.6"',       'LG',       'PC-004',  4,  449.00),
('Fonte ATX 500W',       'C3Tech',   'PC-005', 10,  179.90);

INSERT INTO Ordem_Servico (id_equipamento, id_tecnico, data_entrada, problema_relatado, diagnostico, situacao, valor_servico) VALUES
(1, 1, '2026-09-01', 'Notebook lento e travando',        'HD com setores defeituosos',   'Concluída',       120.00),
(2, 1, '2026-09-03', 'Computador não liga',              'Fonte queimada',               'Concluída',        80.00),
(3, 4, '2026-09-05', 'Tela quebrada',                    'Troca de display necessária',  'Aguardando peça', 150.00),
(4, 2, '2026-09-08', 'Sistema operacional corrompido',   'Reinstalação do Windows',      'Em reparo',        90.00),
(5, 3, '2026-09-10', 'Sem acesso à rede',                NULL,                           'Aberta',           0.00);

INSERT INTO Os_Peca (id_os, id_peca, quantidade_utilizada, valor_unitario_na_os, data_utilizacao) VALUES
(1, 1, 1, 229.90, '2026-09-02'),
(1, 2, 1, 189.00, '2026-09-02'),
(2, 5, 1, 179.90, '2026-09-04'),
(3, 4, 1, 449.00, '2026-09-06'),
(4, 1, 1, 229.90, '2026-09-09'),
(4, 2, 2, 189.00, '2026-09-09');
