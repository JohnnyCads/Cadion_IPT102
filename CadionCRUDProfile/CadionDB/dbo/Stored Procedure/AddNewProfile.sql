CREATE PROCEDURE [dbo].[AddNewProfile]
	@FirstName NVARCHAR(50),
    @SureName NVARCHAR(50),
    @MiddleInitial NVARCHAR(50),
    @Email NVARCHAR(50),
    @PhoneNumber INT,
    @Address NVARCHAR(50),
    @Hobbies NVARCHAR(MAX),
    @PhotoBase64 NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;


    INSERT INTO Persons (FirstName, SureName, MiddleInitial, Email, PhoneNumber, Address, Hobbies, PhotoBase64)
    VALUES (@FirstName, @SureName, @MiddleInitial, @Email, @PhoneNumber, @Address, @Hobbies, @PhotoBase64);

END