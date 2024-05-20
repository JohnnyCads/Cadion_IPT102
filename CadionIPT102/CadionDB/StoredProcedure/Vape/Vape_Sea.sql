CREATE PROCEDURE [dbo].[Vape_Sea]
	@key NVARCHAR(50)

AS
BEGIN
SELECT
[Id] as Id,
[Name] as Name,
[Flavor] as Flavor,
[Milligrams] as Type

FROM [dbo].[Vape]

WHERE 
[Id] like @key or
[Name] like @key or
[Flavor] like @key or
[Milligrams] like @key 

ORDER BY [Name]
END