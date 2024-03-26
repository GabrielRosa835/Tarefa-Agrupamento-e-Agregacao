CREATE TABLE tbl_produtos (
  Id_Produto INTEGER PRIMARY KEY AUTOINCREMENT,
  Nome VARCHAR(50) NOT NULL,
  Preco DECIMAL NOT NULL,
  Estoque INTEGER NOT NULL,
  Perecivel BOOLEAN NOT NULL,
  Marca VARCHAR(50),
  Nacionalidade VARCHAR(50)
)

INSERT INTO tbl_produtos (Nome, Preco, Estoque, Perecivel, Marca, Nacionalidade) VALUES
("Leite", 4.59, 156, "TRUE", "Piracanjuba", "Brasileira"),
("Leite", 5.25, 84, "TRUE", "Nestlé", "Suíça"),
("Leite", 3.89, 132, "TRUE", "Parmalat", "Italiana"),
("Sabonete", 1.50, 150, "FALSE", "Dove", "Britãnica"),
("Sabonete", 1.20, 200, "FALSE", "Nivea", "Alemã");

-- SELECIONANDO TODOS OS PRODUTOS
SELECT * FROM tbl_produtos;

-- SELECIONANDO A QUANTIDADE DE PRODUTOS CADASTRADOS
SELECT COUNT(*) AS "Total de Produtos" FROM tbl_produtos;

-- SELECIONANDO O PREÇO MÉDIO TOTAL DOS PRODUTOS
SELECT AVG(Preco) AS "Média total dos preços" FROM tbl_produtos;

-- SELECIONANDO O PREÇO MÉDIO DOS PRODUTOS SEPARANDO ENTRE PERECÍVEIS E NÃO PERECÍVEIS
SELECT AVG(Preco) AS "Média de preços", Perecivel FROM tbl_produtos GROUP BY Perecivel;

-- SELECIONANDO O PREÇO MÉDIO DOS PRODUTOS AGRUPANDO POR NOME
SELECT AVG(Preco) as "Média de preços", Nome FROM tbl_produtos GROUP BY Nome;

-- SELECIONANDO O PREÇO MÉDIO E A QUANTIDADE TOTAL DE ÍTENS NO ESTOQUE
SELECT AVG(Preco) AS "Média total dos preços", SUM(Estoque) AS "Estoque total" 	from tbl_produtos;

-- SELECIONANDO NOME, MARCA E QUANTIDADE EM ESTOQUE DO PRODUTO MAIS CARO
SELECT Nome, Marca, Estoque AS "Qnt. em estoque" FROM tbl_produtos WHERE Preco = (SELECT MAX(Preco) FROM tbl_produtos);

-- SELECIONANDO OS PRODUTOS COM PREÇO ACIMA DA MÉDIA
SELECT * FROM tbl_produtos WHERE Preco > (SELECT AVG(Preco) FROM tbl_produtos);

-- SELECIONANDO A QUANTIDADE DE PRODUTOS PARA CADA NACIONALIDADE
SELECT COUNT(*) AS "Quantidade de produtos", Nacionalidade FROM tbl_produtos GROUP BY Nacionalidade;

/* ENUNCIADO SOBRE AGRUPAMENTO E AGREGAÇÃO
- Gere um relatório informando quantos produtos estão cadastrados;
- Gere um relatório informando o preço médio dos produtos;
- Selecione a média dos preços dos produtos em 2 grupos: perecíveis e não perecíveis;
- Selecione a média dos preços dos produtos agrupados pelo nome do produto;
- Selecione a média dos preços e total em estoque dos produtos;
- Selecione o nome, marca e quantidade em estoque do produto mais caro;
- Selecione os produtos com preço acima da média;
- Selecione a quantidade de produtos de cada nacionalidade.
*/