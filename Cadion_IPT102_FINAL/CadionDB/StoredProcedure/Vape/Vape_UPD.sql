CREATE PROCEDURE [dbo].[Vape_UPD]
	    @Id INT,
    @Name NVARCHAR(50), 
    @VapeType NVARCHAR(50), 
    @Price NVARCHAR(50)

AS

BEGIN
UPDATE [dbo].[Vape]
SET
[Name] =coalesce(@Name,[Name]) ,
[VapeType] = coalesce(@VapeType,[VapeType]) ,
[Price] =coalesce(@Price,[Price]) 
WHERE [Id]=@Id

END