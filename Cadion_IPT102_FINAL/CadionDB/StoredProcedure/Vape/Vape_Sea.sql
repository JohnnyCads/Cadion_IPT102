CREATE PROCEDURE [dbo].[Vape_Sea]
	@key NVARCHAR(50)

AS
BEGIN
SELECT
[Id] as Id,
[Name] as Name,
[VapeType] as VapeType,
[Price] as Price

FROM [dbo].[Vape]

WHERE 
[Id] like @key or
[Name] like @key or
[VapeType] like @key or
[Price] like @key 

ORDER BY [Name]
END