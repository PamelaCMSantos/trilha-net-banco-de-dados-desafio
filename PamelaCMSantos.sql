-- RESOLUÇÃO DO EXERCÍCIO BANCO DE DADOS --

-- 1 - Buscar o nome e ano dos filmes
-- Utilizando o Select para selecionar o nome e ano da tabela Filmes --
SELECT Nome, Ano FROM Filmes;

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
-- Utilizando o Order By para organizar os filmes por ordem crescente --
SELECT Nome, Ano FROM Filmes ORDER BY Ano;

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
-- Utilizando um Where e passando o noe do filme como condição para a pesquisa-
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome='DE VOLTA PARA O FUTURO';

-- 4 - Buscar os filmes lançados em 1997
-- Utilizando o Wher com a condição do ano, para selecionar filmes lançados em 1997--
SELECT Nome, Duracao, Ano FROM Filmes WHERE Ano= 1997;

-- 5 - Buscar os filmes lançados APÓS o ano 2000
-- Utilizando o o where com a condição ">" para selecionar filmer ápos o ano 2000 --
SELECT* FROM Filmes WHERE Ano > 2000;

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
-- Utilizando os simbolos de Maior e Menor "<,>"para limitar os filmes e ordenando por ordem crescente 
SELECT* FROM Filmes WHERE Duracao > 100 AND Duracao < 150 ORDER BY Duracao;

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
--
SELECT Ano, COUNT(*) AS Quantidade_filme, -- utlizando o count para contar a quanidade de filmes por ano
MAX(Duracao) AS maior_duracao,   -- Utilizando o Max para exibir a maior duração dos filmes agrupados
MIN(Duracao) AS menor_duracao   -- Utilizando o Min para exibir a menor duração dos filmes agrupados
FROM filmes
GROUP BY Ano                -- Uilizando o Group by para agrupar os anos
ORDER BY AVG(Duracao) DESC; -- utlizando o AVG para capturar a média da duração e ordenar de forma decrescente

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
-- Utilizando o % para definir um padrão de busca começando com a letra m de masculino
SELECT PrimeiroNome, UltimoNome 
FROM Atores WHERE 
Genero LIKE 'M%';

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome, UltimoNome 
FROM Atores 
WHERE Genero LIKE 'F%'
ORDER BY PrimeiroNome;
-- 10 - Buscar o nome do filme e o gênero
-- UTILIZANDO UM INNER JOIN PARA JUNTAR AS TABELAS FILMES E GENEROS PARA OBTER O NOME E GENERO DOS FILMES
SELECT f.Nome AS [Nome],
		G.Genero AS [GENERO]
FROM Filmes f
INNER JOIN Generos g ON f.Id= g.Id;
-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
-- Utilizando o % para selecionar generos que começem com mist
SELECT f.Nome AS [Nome],
		G.Genero AS [GENERO]
FROM Filmes f
INNER JOIN Generos g ON f.Id= g.Id
WHERE Genero LIKE 'MIST%';
-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
-- utilizando dois inner join com as tabelas Atores e ElencoFilme para associar a tabela filme
SELECT f.Nome AS [Nome],
		a.PrimeiroNome AS [Nome_Ator],
		a.UltimoNome AS [Sobrenome_Ator],
		e.Papel as [Papel_Ator]
FROM Filmes f
INNER JOIN Atores a ON f.Id= a.Id
INNER JOIN ElencoFilme e ON f.Id= e.Id;