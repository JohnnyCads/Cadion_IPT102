CREATE TABLE [dbo].[Persons]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [FirstName] VARCHAR(50) NULL, 
    [SureName] VARCHAR(50) NULL, 
    [MiddleInitial] VARCHAR(50) NULL, 
    [Email] VARCHAR(50) NULL, 
    [PhoneNumber] INT NULL, 
    [Address] VARCHAR(50) NULL, 
    [Hobbies] NVARCHAR(6) NULL,
    [PhotoBase64] NVARCHAR(MAX) NULL 

)

