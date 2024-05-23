CREATE PROCEDURE [dbo].[Juice_ADD]
	@BrandName NVARCHAR(50), 
    @Flavor NVARCHAR(50), 
    @Price NVARCHAR(50)
AS
BEGIN
INSERT INTO [dbo].[Juice]
(
[BrandName],
[Flavor],
[Price]
)
VALUES
(
@BrandName,
@Flavor,
@Price
)

END