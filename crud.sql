-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
  (nome, lealdade)
VALUES
	('Georgia', '0');

-- 2)
INSERT INTO pedidos 
	(status, cliente_id)
VALUES
	('Recebido', '7');
-- 3)
INSERT INTO produtos_pedidos 
	(pedido_id, produto_id)
VALUES 
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);

-- Leitura
-- 1)
SELECT 
  clientes.nome,
  clientes.lealdade,
  ped.id,
  ped.status,
  ped.cliente_id ,
  prod.id,
  prod.nome,
  prod.tipo,
  prod.preço,
  prod.pts_de_lealdade
FROM 
  produtos_pedidos pp
JOIN 
  produtos prod ON prod.id = pp.produto_id
JOIN 
  pedidos ped ON ped.id = pp.pedido_id
JOIN 
  clientes ON clientes.id = ped.cliente_id 
WHERE  
  clientes.nome = 'Georgia';

-- Atualização
-- 1)
UPDATE
	clientes
SET
	lealdade = (
SELECT 
	sum(prod.pts_de_lealdade)
FROM 
	pedidos ped
JOIN 
	produtos_pedidos pp ON ped.id = pp.pedido_id
JOIN 
	produtos prod ON pp.produto_id = prod.id
JOIN 
	clientes  ON ped.cliente_id = clientes.id 
WHERE 
	clientes.nome = 'Georgia'
)
WHERE 
	clientes.nome = 'Georgia'
RETURNING *;
-- Deleção
-- 1)
DELETE FROM
	clientes 
WHERE
	clientes.nome = 'Marcelo'
RETURNING *;


