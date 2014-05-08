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
VALUES	('Culture Québécoise'),
		('Ressources'),
		('Autre & Discussion Générale')
GO

INSERT INTO Boards (BoardName, BoardCategoryID)
VALUES	('Cuisine', 1), 
		('Histoire', 1),
		('Cinéma', 1), 
		('Musique', 1),
		('Théâtre', 1),
		('Autre', 1),
		('Téléphones importants', 2),
		('Lieux importants', 2),
		('Lois québécoises', 2),
		('Autre', 2),
		('Nouveautés', 3),
		('Commentaires & Suggestions', 3),
		('Discussion générale', 3)
GO