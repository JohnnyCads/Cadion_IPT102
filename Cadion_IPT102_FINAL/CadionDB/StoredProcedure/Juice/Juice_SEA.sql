CREATE PROCEDURE [dbo].[Juice_SEA]
	@key NVARCHAR(50)

AS
BEGIN
SELECT
[Id] as Id,
[BrandName] as BrandName,
[Flavor] as Flavor,
[Price] as Price

FROM [dbo].[Juice]

WHERE 
[Id] like @key or
[BrandName] like @key or
[Flavor] like @key or
[Price] like @key 

ORDER BY [BrandName]
END