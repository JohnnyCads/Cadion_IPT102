CREATE PROCEDURE [dbo].[Vape_UPD]
	    @Id INT,
    @Name NVARCHAR(50), 
    @CourseYear NVARCHAR(50), 
    @Title NVARCHAR(50)

AS

BEGIN
UPDATE [dbo].[Vape]
SET
[Name] =coalesce(@Name,[Name]) ,
[Course/Year] = coalesce(@CourseYear,[Course/Year]) ,
[Title] =coalesce(@Title,[Title]) 
WHERE [Id]=@Id

END