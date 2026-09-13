--DDL (Data Definition Language)

CREATE TABLE Cliente (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20)
);

CREATE TABLE Pedido (
    Codigo INT PRIMARY KEY,
    Dt_entrada DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    Dt_Embarque DATE,
    Desconto DECIMAL(10, 2),
    Tipo VARCHAR(50) NOT NULL,
    ID_Clientefk INT NOT NULL,
    
	FOREIGN KEY (ID_Clientefk) 
	  REFERENCES Cliente(Codigo)
);


CREATE TABLE Produto (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    UnidadeMedida VARCHAR(10) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Itens_dos_pedidos (
    ID_pedidofk INT NOT NULL,
    ID_produtofk INT NOT NULL,
    Quantidade DECIMAL(10, 2) NOT NULL,
    SubTotal DECIMAL(10, 2) NOT NULL,
	
    PRIMARY KEY (ID_pedidofk, ID_produtofk),
	
    FOREIGN KEY (ID_pedidofk) 
	 REFERENCES Pedido(Codigo),
	 
    FOREIGN KEY (ID_produtofk) 
	 REFERENCES Produto(Codigo)
);


--DML (Data Manipulation Language)

-- =========================================================
-- 1. INSERÇÃO DE CLIENTES (Mínimo 5: com e sem telefone)
-- =========================================================
INSERT INTO Cliente (Codigo, Nome, Email, Telefone) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', '11987654321'),
(2, 'Bruno Souza', 'bruno@email.com', NULL),
(3, 'Carla Oliveira', 'carla.o@email.com', '21976543210'),
(4, 'Diego Ferreira', 'diego.f@email.com', NULL),
(5, 'Elena Santos', 'elena.s@email.com', '31965432109');

-- =========================================================
-- 2. INSERÇÃO DE PRODUTOS (Mínimo 8: variação de preços e unidades UN, KG, L, CX)
-- =========================================================
INSERT INTO Produto (Codigo, Nome, UnidadeMedida, Preco) VALUES
(1, 'Caneta Azul', 'UN', 2.50),
(2, 'Arroz Tipo 1', 'KG', 5.90),
(3, 'Leite Integral', 'L', 4.20),
(4, 'Caixa de Lápis', 'CX', 15.00),
(5, 'Feijão Preto', 'KG', 7.80),
(6, 'Detergente Líquido', 'L', 3.10),
(7, 'Caderno Universitário', 'UN', 22.90),
(8, 'Caixa de Grampos', 'CX', 8.50);

-- =========================================================
-- 3. INSERÇÃO DE PEDIDOS (Mínimo 6: datas variadas, com/sem desconto, embarcados/não embarcados)
-- =========================================================
INSERT INTO Pedido (Codigo, Dt_entrada, ValorTotal, Dt_Embarque, Desconto, Tipo, ID_Clientefk) VALUES
(1, '2026-08-01', 54.50, '2026-08-03', 5.00, 'Online', 1),
(2, '2026-08-10', 72.00, NULL, 0.00, 'Balcão', 2),
(3, '2026-08-15', 46.70, '2026-08-18', 10.00, 'Online', 1),
(4, '2026-09-01', 102.70, NULL, 15.00, 'Entrega', 3),
(5, '2026-09-03', 25.50, '2026-09-04', 0.00, 'Online', 4),
(6, '2026-09-04', 264.50, NULL, NULL, 'Corporativo', 5);

-- =========================================================
-- 4. INSERÇÃO DE ITENS DE PEDIDOS (Mínimo 12 itens distribuídos nos pedidos)
-- =========================================================
INSERT INTO Itens_dos_pedidos (ID_pedidofk, ID_produtofk, Quantidade, SubTotal) VALUES
-- Itens do Pedido 1
(1, 1, 10, 25.00),
(1, 2, 5, 29.50),

-- Itens do Pedido 2
(2, 3, 10, 42.00),
(2, 4, 2, 30.00),

-- Itens do Pedido 3
(3, 5, 4, 31.20),
(3, 6, 5, 15.50),

-- Itens do Pedido 4
(4, 7, 3, 68.70),
(4, 8, 4, 34.00),

-- Itens do Pedido 5
(5, 1, 4, 10.00),
(5, 6, 5, 15.50),

-- Itens do Pedido 6
(6, 4, 10, 150.00),
(6, 7, 5, 114.50);

-- =========================================================
-- PARTE 1: OPERAÇÕES COM UPDATE
-- =========================================================

-- 1. Altere o telefone de um cliente.
-- Antes da alteração:
SELECT Codigo, Nome, Telefone FROM Cliente WHERE Codigo = 2;

-- Alteração:
UPDATE Cliente
SET Telefone = '11912345678'
WHERE Codigo = 2;

-- Depois da alteração:
SELECT Codigo, Nome, Telefone FROM Cliente WHERE Codigo = 2;


-- 2. Aumente o preço de um produto em 10%.
-- Antes da alteração:
SELECT Codigo, Nome, Preco FROM Produto WHERE Codigo = 1;

-- Alteração:
UPDATE Produto
SET Preco = Preco * 1.10
WHERE Codigo = 1;

-- Depois da alteração:
SELECT Codigo, Nome, Preco FROM Produto WHERE Codigo = 1;


-- 3. Registre a data de embarque de um pedido.
-- Antes da alteração:
SELECT Codigo, Dt_Embarque FROM Pedido WHERE Codigo = 2;

-- Alteração:
UPDATE Pedido
SET Dt_Embarque = '2026-09-05'
WHERE Codigo = 2;

-- Depois da alteração:
SELECT Codigo, Dt_Embarque FROM Pedido WHERE Codigo = 2;


-- 4. Altere o desconto de um pedido.
-- Antes da alteração:
SELECT Codigo, Desconto FROM Pedido WHERE Codigo = 1;

-- Alteração:
UPDATE Pedido
SET Desconto = 12.50
WHERE Codigo = 1;

-- Depois da alteração:
SELECT Codigo, Desconto FROM Pedido WHERE Codigo = 1;


-- =========================================================
-- PARTE 2: OPERAÇÕES COM DELETE
-- =========================================================

-- 1. Cadastre um produto de teste que não esteja relacionado a nenhum pedido.
INSERT INTO Produto (Codigo, Nome, UnidadeMedida, Preco) VALUES
(99, 'Produto Teste Exclusão', 'UN', 10.00);

-- 2. Consulte o produto para confirmar seu cadastro.
SELECT * FROM Produto WHERE Codigo = 99;

-- 3. Exclua o produto utilizando sua chave primária.
DELETE FROM Produto
WHERE Codigo = 99;

-- 4. Consulte novamente para confirmar a exclusão.
SELECT * FROM Produto WHERE Codigo = 99;

--DQL (Data Query Language) - Consultas e Filtros

-- 1. Liste todos os clientes.
SELECT * FROM Cliente;

-- 2. Mostre o nome e o telefone dos clientes.
SELECT Nome, Telefone FROM Cliente;

-- 3. Liste os clientes em ordem alfabética.
SELECT * FROM Cliente ORDER BY Nome ASC;

-- 4. Localize os clientes cujo nome começa com A.
SELECT * FROM Cliente WHERE Nome LIKE 'A%';

-- 5. Localize os clientes cujo nome contém Silva.
SELECT * FROM Cliente WHERE Nome LIKE '%Silva%';

-- 6. Mostre os clientes sem telefone cadastrado.
SELECT * FROM Cliente WHERE Telefone IS NULL;

-- 7. Liste todos os produtos.
SELECT * FROM Produto;

-- 8. Mostre o nome e o preço dos produtos.
SELECT Nome, Preco FROM Produto;

-- 9. Liste os produtos em ordem crescente de preço.
SELECT * FROM Produto ORDER BY Preco ASC;

-- 10. Mostre os produtos com preço superior a R$ 50,00.
SELECT * FROM Produto WHERE Preco > 50.00;

-- 11. Mostre os produtos com preço entre R$ 10,00 e R$ 100,00.
SELECT * FROM Produto WHERE Preco BETWEEN 10.00 AND 100.00;

-- 12. Mostre os produtos cuja unidade de medida é UN.
SELECT * FROM Produto WHERE UnidadeMedida = 'UN';

-- 13. Mostre os produtos cuja unidade de medida é KG ou L.
SELECT * FROM Produto WHERE UnidadeMedida IN ('KG', 'L');

-- 14. Liste todos os pedidos.
SELECT * FROM Pedido;

-- 15. Mostre os pedidos com desconto maior que zero.
SELECT * FROM Pedido WHERE Desconto > 0;

-- 16. Mostre os pedidos que ainda não foram embarcados.
SELECT * FROM Pedido WHERE Dt_Embarque IS NULL;

-- 17. Mostre os pedidos que já foram embarcados.
SELECT * FROM Pedido WHERE Dt_Embarque IS NOT NULL;

-- 18. Mostre os pedidos realizados em uma data específica.
SELECT * FROM Pedido WHERE Dt_entrada = '2026-08-01';

-- 19. Mostre os pedidos realizados entre duas datas.
SELECT * FROM Pedido WHERE Dt_entrada BETWEEN '2026-08-01' AND '2026-08-31';

-- 20. Liste os pedidos em ordem decrescente de valor total.
SELECT * FROM Pedido ORDER BY ValorTotal DESC;

-- 21. Mostre os pedidos com valor total superior a R$ 500,00.
SELECT * FROM Pedido WHERE ValorTotal > 500.00;

-- 22. Mostre os itens cuja quantidade seja maior que três.
SELECT * FROM ItemPedido WHERE Quantidade > 3;

-- 23. Mostre os itens com subtotal superior a R$ 100,00.
SELECT * FROM ItemPedido WHERE SubTotal > 100.00;

-- 24. Conte quantos clientes estão cadastrados.
SELECT COUNT(*) AS TotalClientes FROM Cliente;

-- 25. Conte quantos produtos estão cadastrados.
SELECT COUNT(*) AS TotalProdutos FROM Produto;

-- 26. Mostre o maior preço dos produtos.
SELECT MAX(Preco) AS MaiorPreco FROM Produto;

-- 27. Mostre o menor preço dos produtos.
SELECT MIN(Preco) AS MenorPreco FROM Produto;

-- 28. Calcule a média dos preços.
SELECT AVG(Preco) AS MediaPrecos FROM Produto;

-- 29. Calcule a soma dos valores dos pedidos.
SELECT SUM(ValorTotal) AS SomaValoresPedidos FROM Pedido;

-- 30. Conte quantos pedidos ainda não foram embarcados.
SELECT COUNT(*) AS PedidosNaoEmbarcados FROM Pedido WHERE Dt_Embarque IS NULL;

