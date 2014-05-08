USE TPW24
GO

CREATE TABLE BoardCategories (
  BoardCategoryID INT IDENTITY(1,1) PRIMARY KEY,
  BoardCategoryName VARCHAR(100) NOT NULL
)
GO

ALTER TABLE boards
ADD BoardCategoryID INT FOREIGN KEY REFERENCES BoardCategories(BoardCategoryID)
GO

INSERT INTO boardcategories (BoardCategoryName)
VALUES	('Culture Qu�b�coise'),
		('Ressources'),
		('Autre & Discussion G�n�rale')
GO

INSERT INTO Boards (BoardName, BoardCategoryID)
VALUES	('Cuisine', 1), 
		('Histoire', 1),
		('Cin�ma', 1), 
		('Musique', 1),
		('Th��tre', 1),
		('Autre', 1),
		('T�l�phones importants', 2),
		('Lieux importants', 2),
		('Lois qu�b�coises', 2),
		('Autre', 2),
		('Nouveaut�s', 3),
		('Commentaires & Suggestions', 3),
		('Discussion g�n�rale', 3)
GO