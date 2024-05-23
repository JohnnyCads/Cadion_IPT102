CREATE PROCEDURE [dbo].[Vape_ADD]
	@Name NVARCHAR(50), 
    @VapeType NVARCHAR(50), 
    @Price NVARCHAR(50)
AS
BEGIN
INSERT INTO [dbo].[Vape]
(
[Name],
[VapeType],
[Price]
)
VALUES
(
@Name,
@VapeType,
@Price
)

END