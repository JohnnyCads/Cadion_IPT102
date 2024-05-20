CREATE PROCEDURE [dbo].[Vape_ADD]
	@Name NVARCHAR(50), 
    @Flavor NVARCHAR(50), 
    @Milligrams NVARCHAR(50)
AS
BEGIN
INSERT INTO [dbo].[Vape]
(
[Name],
[Flavor],
[Milligrams]
)
VALUES
(
@Name,
@Flavor,
@Milligrams
)

END