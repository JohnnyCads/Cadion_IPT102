CREATE PROCEDURE [dbo].[Juice_UPD]
	 @Id INT,
    @BrandName NVARCHAR(50), 
    @Flavor NVARCHAR(50), 
    @Price NVARCHAR(50)

AS

BEGIN
UPDATE [dbo].[Juice]
SET
[BrandName] =coalesce(@BrandName,[BrandName]) ,
[Flavor] = coalesce(@Flavor,[Flavor]) ,
[Price] =coalesce(@Price,[Price]) 
WHERE [Id]=@Id

END