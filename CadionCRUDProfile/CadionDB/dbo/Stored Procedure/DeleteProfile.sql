CREATE PROCEDURE [dbo].[DeleteProfile]
 @Id int
AS
BEGIN
        DELETE FROM [dbo].[Persons]
        WHERE [Id] = @Id;
END;