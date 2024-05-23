CREATE TABLE [dbo].[User]
(
	[Password] NVARCHAR(50) NOT NULL , 
    [Username] NVARCHAR(50) NOT NULL, 
    [Class] NVARCHAR(50) NULL, 
    [Id] INT NOT NULL IDENTITY, 
    PRIMARY KEY ([Username], [Password])  
)