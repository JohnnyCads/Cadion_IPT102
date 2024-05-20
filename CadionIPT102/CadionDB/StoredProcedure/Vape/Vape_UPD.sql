CREATE PROCEDURE [dbo].[Vape_UPD]
	    @Id INT,
    @Name NVARCHAR(50), 
    @Flavor NVARCHAR(50), 
    @Milligrams NVARCHAR(50)

AS

BEGIN
UPDATE [dbo].[Vape]
SET
[Name] =coalesce(@Name,[Name]) ,
[Flavor] = coalesce(@Flavor,[Flavor]) ,
[Milligrams] =coalesce(@Milligrams,[Milligrams]) 
WHERE [Id]=@Id

END