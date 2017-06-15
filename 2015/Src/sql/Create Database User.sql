/* Run on the 'Master' Database */

CREATE LOGIN username WITH password='>.> aaaaBBBBccccDDDD'
GO
 
CREATE USER [username] FOR LOGIN [username] WITH DEFAULT_SCHEMA=[dbo]
GO

/* Run on the Database */

CREATE USER [username] FOR LOGIN [username] WITH DEFAULT_SCHEMA=[dbo]
GO
 
EXEC sp_addrolemember 'db_owner', 'username';
GO