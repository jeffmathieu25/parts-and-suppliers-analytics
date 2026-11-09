-- Parts and Suppliers | Collaborative academic project
-- TOTI Class 59, Group 05
-- Inputs: approved final-snapshot SQLite tables. Read-only analytical queries.

-- Analysis 1
SELECT
    ROUND(SUM(valor_total), 2) AS gasto_total,
    SUM(quantidade) AS unidades_compradas,
    COUNT(DISTINCT id_pedido) AS total_pedidos,
    ROUND(AVG(valor_total), 2) AS ticket_medio
FROM compras;

-- Analysis 2
SELECT
    ano_mes,
    ROUND(SUM(valor_total), 2) AS gasto_mensal,
    SUM(quantidade) AS quantidade_mensal,
    COUNT(*) AS pedidos
FROM compras
GROUP BY ano_mes
ORDER BY ano_mes;

-- Analysis 3
SELECT
    p.categoria,
    ROUND(SUM(c.valor_total), 2) AS gasto_total,
    SUM(c.quantidade) AS unidades,
    ROUND(100.0 * SUM(c.valor_total) / (SELECT SUM(valor_total) FROM compras), 2) AS participacao_gasto_pct
FROM compras c
JOIN pecas p ON p.codigo_peca = c.codigo_peca
GROUP BY p.categoria
ORDER BY gasto_total DESC;

-- Analysis 4
SELECT
    f.codigo_fornecedor,
    f.nome_fornecedor,
    f.estado,
    ROUND(SUM(c.valor_total), 2) AS gasto_total,
    COUNT(*) AS total_pedidos,
    COUNT(DISTINCT c.codigo_peca) AS pecas_fornecidas,
    ROUND(100.0 * SUM(CASE WHEN c.dias_atraso > 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS taxa_atraso_pct,
    ROUND(AVG(c.dias_atraso), 2) AS atraso_medio_dias,
    ROUND(100.0 * SUM(c.unidades_defeituosas) / SUM(c.quantidade), 2) AS taxa_defeito_pct
FROM compras c
JOIN fornecedores f ON f.codigo_fornecedor = c.codigo_fornecedor
GROUP BY f.codigo_fornecedor, f.nome_fornecedor, f.estado
ORDER BY gasto_total DESC;

-- Analysis 5
SELECT
    p.codigo_peca,
    p.nome_peca,
    p.categoria,
    p.criticidade,
    ROUND(SUM(c.valor_total), 2) AS gasto_total,
    SUM(c.quantidade) AS quantidade,
    ROUND(AVG(c.preco_unitario), 2) AS preco_medio
FROM compras c
JOIN pecas p ON p.codigo_peca = c.codigo_peca
GROUP BY p.codigo_peca, p.nome_peca, p.categoria, p.criticidade
ORDER BY gasto_total DESC
LIMIT 15;

-- Analysis 6
SELECT
    p.codigo_peca,
    p.nome_peca,
    p.categoria,
    COUNT(o.codigo_fornecedor) AS fornecedores_disponiveis,
    ROUND(MIN(o.preco_ofertado), 2) AS menor_preco,
    ROUND(MAX(o.preco_ofertado), 2) AS maior_preco,
    ROUND(MAX(o.preco_ofertado) - MIN(o.preco_ofertado), 2) AS amplitude_preco,
    ROUND(100.0 * (MAX(o.preco_ofertado) - MIN(o.preco_ofertado)) / MAX(o.preco_ofertado), 2) AS amplitude_pct
FROM ofertas o
JOIN pecas p ON p.codigo_peca = o.codigo_peca
GROUP BY p.codigo_peca, p.nome_peca, p.categoria
ORDER BY amplitude_pct DESC
LIMIT 15;

-- Analysis 7
WITH cobertura AS (
    SELECT codigo_peca, COUNT(DISTINCT codigo_fornecedor) AS fornecedores_disponiveis
    FROM ofertas
    GROUP BY codigo_peca
), gasto AS (
    SELECT codigo_peca, SUM(valor_total) AS gasto_total
    FROM compras
    GROUP BY codigo_peca
)
SELECT
    p.codigo_peca,
    p.nome_peca,
    p.categoria,
    p.criticidade,
    cb.fornecedores_disponiveis,
    ROUND(COALESCE(g.gasto_total, 0), 2) AS gasto_total
FROM pecas p
JOIN cobertura cb ON cb.codigo_peca = p.codigo_peca
LEFT JOIN gasto g ON g.codigo_peca = p.codigo_peca
WHERE cb.fornecedores_disponiveis <= 2
ORDER BY
    CASE p.criticidade WHEN 'High' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END,
    gasto_total DESC;

-- Analysis 8
WITH part_totals AS (
  SELECT codigo_peca, SUM(valor_total) AS spend, SUM(quantidade) AS quantity
  FROM compras GROUP BY codigo_peca
), minimum_quotes AS (
  SELECT codigo_peca, MIN(preco_ofertado) AS min_quote
  FROM ofertas GROUP BY codigo_peca
)
SELECT ROUND(SUM(MAX(0, p.spend-p.quantity*q.min_quote)),2) AS potential_savings
FROM part_totals p JOIN minimum_quotes q USING(codigo_peca);
