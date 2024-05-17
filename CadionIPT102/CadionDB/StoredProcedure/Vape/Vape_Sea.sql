CREATE PROCEDURE [dbo].[Vape_Sea]
	@key NVARCHAR(50)

AS
BEGIN
SELECT
[Id] as Id,
[Name] as Name,
[Course/Year] as CourseYear,
[Title] as Title

FROM [dbo].[Vape]

WHERE 
[Id] like @key or
[Name] like @key or
[Course/Year] like @key or
[Title] like @key 

ORDER BY [Name]
END