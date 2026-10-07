PRAGMA foreign_keys = ON;

-- Equipamento do cliente
SELECT e.id_equipamento, e.tipo, e.marca, e.modelo, c.nome AS proprietario
FROM Equipamento e
JOIN Cliente c ON c.id_cliente = e.id_cliente;

-- ordem de serviço
SELECT os.id_os, os.data_entrada, e.tipo, e.marca, e.modelo
FROM Ordem_Servico os
JOIN Equipamento e ON e.id_equipamento = os.id_equipamento;

-- Técnico responsável cada OS
SELECT os.id_os, os.situacao, t.nome AS tecnico
FROM Ordem_Servico os
JOIN Tecnico t ON t.id_tecnico = os.id_tecnico;

-- Visão completa
SELECT os.id_os, c.nome AS cliente, e.marca || ' ' || e.modelo AS equipamento,
       t.nome AS tecnico, os.problema_relatado, os.situacao, os.valor_servico
FROM Ordem_Servico os
JOIN Equipamento e ON e.id_equipamento = os.id_equipamento
JOIN Cliente c     ON c.id_cliente     = e.id_cliente
JOIN Tecnico t     ON t.id_tecnico     = os.id_tecnico;

-- Pecas usadas por OS
SELECT os.id_os, p.descricao, op.quantidade_utilizada,
       op.valor_unitario_na_os * op.quantidade_utilizada AS subtotal
FROM Os_Peca op
JOIN Ordem_Servico os ON os.id_os = op.id_os
JOIN Peca p           ON p.id_peca = op.id_peca
ORDER BY os.id_os;

-- Total de cada OS
SELECT os.id_os, os.valor_servico,
       COALESCE(SUM(op.quantidade_utilizada * op.valor_unitario_na_os),0) AS total_pecas,
       os.valor_servico + COALESCE(SUM(op.quantidade_utilizada * op.valor_unitario_na_os),0) AS total_os
FROM Ordem_Servico os
LEFT JOIN Os_Peca op ON op.id_os = os.id_os
GROUP BY os.id_os;