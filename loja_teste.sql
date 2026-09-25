-- BANCO DE TESTES: LOJA / VENDAS
-- Compatível com SQLite
-- 10 categorias + 30 clientes + 40 produtos + 20 pedidos + 50 itens

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE
);

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cidade TEXT NOT NULL,
    estado TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL,
    estoque INTEGER NOT NULL DEFAULT 0,
    categoria_id INTEGER NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    data TEXT NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pedido_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario REAL NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- CATEGORIAS
INSERT INTO categorias (nome) VALUES
('Informática'),
('Periféricos'),
('Monitores'),
('Celulares'),
('Áudio'),
('Acessórios'),
('Armazenamento'),
('Redes'),
('Impressoras'),
('Móveis');

-- CLIENTES
INSERT INTO clientes (nome, cidade, estado, email) VALUES
('Eduardo Esser','Joinville','SC','cliente1@email.com'),
('Carlos Silva','Araquari','SC','cliente2@email.com'),
('Mariana Souza','Blumenau','SC','cliente3@email.com'),
('João Pereira','São José','SC','cliente4@email.com'),
('Ana Costa','Itajaí','SC','cliente5@email.com'),
('Lucas Martins','Jaraguá do Sul','SC','cliente6@email.com'),
('Beatriz Oliveira','Joinville','SC','cliente7@email.com'),
('Rafael Santos','Brusque','SC','cliente8@email.com'),
('Camila Rocha','São Bento do Sul','SC','cliente9@email.com'),
('Felipe Almeida','Joinville','SC','cliente10@email.com'),
('Gabriel Lima','Araquari','SC','cliente11@email.com'),
('Larissa Fernandes','Itapema','SC','cliente12@email.com'),
('Bruno Rodrigues','Balneário Camboriú','SC','cliente13@email.com'),
('Juliana Alves','Joinville','SC','cliente14@email.com'),
('Pedro Gomes','Blumenau','SC','cliente15@email.com'),
('Amanda Ribeiro','Itajaí','SC','cliente16@email.com'),
('Thiago Carvalho','Jaraguá do Sul','SC','cliente17@email.com'),
('Isabela Mendes','Joinville','SC','cliente18@email.com'),
('Diego Barbosa','Araquari','SC','cliente19@email.com'),
('Letícia Nunes','São José','SC','cliente20@email.com'),
('Matheus Castro','Joinville','SC','cliente21@email.com'),
('Paula Teixeira','Blumenau','SC','cliente22@email.com'),
('André Vieira','Itajaí','SC','cliente23@email.com'),
('Sofia Moreira','Brusque','SC','cliente24@email.com'),
('Renato Dias','Joinville','SC','cliente25@email.com'),
('Clara Freitas','Araquari','SC','cliente26@email.com'),
('Gustavo Lopes','São Bento do Sul','SC','cliente27@email.com'),
('Bianca Ramos','Joinville','SC','cliente28@email.com'),
('Henrique Cardoso','Itapema','SC','cliente29@email.com'),
('Fernanda Correia','Blumenau','SC','cliente30@email.com');

-- PRODUTOS
INSERT INTO produtos (nome, preco, estoque, categoria_id) VALUES
('Teclado Mecânico', 249.90, 15, 1),
('Mouse Gamer', 149.90, 32, 2),
('Headset USB', 199.90, 18, 2),
('Webcam Full HD', 229.90, 12, 1),
('Monitor 24 polegadas', 899.90, 8, 3),
('Monitor 27 polegadas', 1299.90, 6, 3),
('Notebook 15 polegadas', 3499.90, 5, 1),
('SSD 480GB', 299.90, 25, 7),
('SSD 1TB', 499.90, 17, 7),
('HD Externo 1TB', 379.90, 14, 7),
('Pen Drive 64GB', 49.90, 50, 7),
('Roteador Wi-Fi', 189.90, 20, 8),
('Switch 8 Portas', 159.90, 13, 8),
('Cabo de Rede 10m', 39.90, 40, 8),
('Impressora Multifuncional', 799.90, 7, 9),
('Cartucho Preto', 89.90, 25, 9),
('Caixa de Som', 129.90, 21, 5),
('Fone Bluetooth', 179.90, 16, 5),
('Smartphone Básico', 1199.90, 9, 4),
('Smartphone Pro', 2499.90, 7, 4),
('Cabo USB-C', 39.90, 60, 6),
('Carregador USB-C', 79.90, 35, 6),
('Hub USB', 99.90, 24, 6),
('Adaptador HDMI', 69.90, 27, 6),
('Cadeira Escritório', 899.90, 5, 10),
('Mesa Escritório', 699.90, 4, 10),
('Mouse Pad Grande', 59.90, 45, 2),
('Teclado Sem Fio', 129.90, 22, 2),
('Memória RAM 8GB', 159.90, 19, 7),
('Memória RAM 16GB', 289.90, 11, 7),
('Placa de Rede', 119.90, 18, 8),
('Access Point', 349.90, 10, 8),
('Nobreak 1200VA', 699.90, 8, 1),
('Estabilizador', 229.90, 12, 1),
('Microfone USB', 299.90, 10, 5),
('SSD NVMe 1TB', 599.90, 9, 7),
('Tablet 10 polegadas', 999.90, 8, 4),
('Smartwatch', 499.90, 14, 4),
('Projetor', 1899.90, 4, 3),
('Scanner', 649.90, 6, 9);

-- PEDIDOS
INSERT INTO pedidos (cliente_id, data, status) VALUES
(21,'2026-02-01','Enviado'),
(8,'2026-04-05','Pendente'),
(22,'2026-09-03','Cancelado'),
(14,'2026-01-01','Pendente'),
(7,'2026-04-17','Cancelado'),
(1,'2026-09-07','Cancelado'),
(14,'2026-04-15','Cancelado'),
(9,'2026-01-25','Pago'),
(23,'2026-07-11','Enviado'),
(5,'2026-04-25','Enviado'),
(4,'2026-02-13','Pendente'),
(12,'2026-06-20','Enviado'),
(26,'2026-01-24','Concluído'),
(18,'2026-02-13','Pendente'),
(18,'2026-05-27','Cancelado'),
(29,'2026-06-19','Pago'),
(23,'2026-02-02','Pago'),
(25,'2026-05-03','Pago'),
(28,'2026-02-13','Enviado'),
(15,'2026-06-06','Enviado');

-- ITENS DOS PEDIDOS
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1,23,2,99.90),
(1,18,1,179.90),
(2,39,2,1899.90),
(2,35,2,299.90),
(3,11,4,49.90),
(3,25,3,899.90),
(4,36,2,599.90),
(4,21,1,39.90),
(5,15,1,799.90),
(5,21,4,39.90),
(6,18,1,179.90),
(6,14,3,39.90),
(7,14,4,39.90),
(7,26,4,699.90),
(8,10,3,379.90),
(8,9,2,499.90),
(9,36,3,599.90),
(9,38,4,499.90),
(10,38,4,499.90),
(10,24,2,69.90),
(11,9,4,499.90),
(11,6,1,1299.90),
(11,8,2,299.90),
(12,11,4,49.90),
(12,39,1,1899.90),
(12,25,4,899.90),
(13,39,4,1899.90),
(13,34,3,229.90),
(13,36,1,599.90),
(14,8,3,299.90),
(14,22,1,79.90),
(14,19,4,1199.90),
(15,11,4,49.90),
(15,1,3,249.90),
(15,33,2,699.90),
(16,33,1,699.90),
(16,20,2,2499.90),
(16,10,3,379.90),
(17,11,1,49.90),
(17,39,3,1899.90),
(17,32,1,349.90),
(18,8,3,299.90),
(18,20,2,2499.90),
(18,4,2,229.90),
(19,37,1,999.90),
(19,6,4,1299.90),
(19,5,2,899.90),
(20,9,4,499.90),
(20,36,2,599.90),
(20,17,4,129.90);

-- CONSULTAS PARA TESTAR

-- 1. Todos os clientes
-- SELECT * FROM clientes;

-- 2. Produtos acima de R$ 500
-- SELECT * FROM produtos WHERE preco > 500;

-- 3. Produtos e suas categorias
-- SELECT p.nome, p.preco, c.nome AS categoria
-- FROM produtos p
-- JOIN categorias c ON c.id = p.categoria_id;

-- 4. Pedidos com nome do cliente
-- SELECT p.id, c.nome, p.data, p.status
-- FROM pedidos p
-- JOIN clientes c ON c.id = p.cliente_id;

-- 5. Total de cada pedido
-- SELECT pedido_id,
--        SUM(quantidade * preco_unitario) AS total
-- FROM itens_pedido
-- GROUP BY pedido_id;

-- 6. Total gasto por cliente
-- SELECT c.nome,
--        SUM(i.quantidade * i.preco_unitario) AS total
-- FROM clientes c
-- JOIN pedidos p ON p.cliente_id = c.id
-- JOIN itens_pedido i ON i.pedido_id = p.id
-- GROUP BY c.id
-- ORDER BY total DESC;

-- 7. Quantidade vendida de cada produto
-- SELECT p.nome,
--        SUM(i.quantidade) AS quantidade_vendida
-- FROM produtos p
-- JOIN itens_pedido i ON i.produto_id = p.id
-- GROUP BY p.id
-- ORDER BY quantidade_vendida DESC;

-- 8. Atualização
-- UPDATE produtos SET estoque = estoque - 1 WHERE id = 1;

-- 9. Exclusão
-- DELETE FROM clientes WHERE id = 30;
