-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados
-- 1)
 SELECT
 	pedidos.id,
 	pedidos.status,
 	pedidos.cliente_id,
 	produtos.id,
 	produtos.nome,
 	produtos.tipo,
 	produtos.preço,
 	produtos.pts_de_lealdade 
 FROM 
 	pedidos
 JOIN
 	produtos_pedidos ON  pedidos.id = produtos_pedidos.produto_id 
 JOIN
 	produtos ON produtos.id = produtos_pedidos.produto_id;
-- 2)
SELECT 
	pp.pedido_id 
FROM 
	produtos_pedidos pp
JOIN 
	produtos prod ON pp.produto_id = prod.id
JOIN 
	pedidos ped ON pp.pedido_id = ped.id
JOIN 
	clientes ON ped.cliente_id = clientes.id 
WHERE 
	prod.nome = 'Fritas';
-- 3)
SELECT 
	clientes.nome gostam_de_fritas 
FROM 
	produtos_pedidos pp
JOIN 
	produtos prod ON pp.produto_id = prod.id
JOIN 
	pedidos ped ON pp.pedido_id = ped.id
JOIN 
	clientes ON ped.cliente_id = clientes.id 
WHERE 
	prod.nome = 'Fritas';
-- 4)
SELECT 
	round(sum(prod.preço)::NUMERIC ,2) Total_do_pedido
FROM 
	produtos_pedidos pp
JOIN 
	produtos prod ON pp.produto_id = prod.id 
JOIN
	pedidos ped ON pp.pedido_id = ped.id 
JOIN 
	clientes ON ped.cliente_id = clientes.id
WHERE clientes.nome = 'Laura';
-- 5)
SELECT 
	prod.nome, count(prod.nome)
FROM
	pedidos ped
JOIN 
	produtos_pedidos pp ON ped.id = pp.pedido_id 
JOIN 
	produtos prod  ON pp.produto_id = prod.id 
JOIN 
	clientes ON ped.cliente_id = clientes.id 
GROUP BY prod.nome
ORDER BY prod.nome;
