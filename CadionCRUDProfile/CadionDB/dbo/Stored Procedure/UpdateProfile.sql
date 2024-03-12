 CREATE PROCEDURE [dbo].[UpdateProfile]
	     @Id INT,
        @FirstName NVARCHAR(MAX),
        @SureName NVARCHAR(MAX),
        @MiddleInitial NVARCHAR(MAX),
        @Email NVARCHAR(MAX),
        @PhoneNumber NVARCHAR(MAX),
        @Address NVARCHAR(MAX),
        @Hobbies NVARCHAR(MAX),
        @PhotoBase64 NVARCHAR(MAX)
    AS
    BEGIN
        UPDATE [dbo].[Persons]
        SET
            [FirstName] = @FirstName,
            [SureName] = @SureName,
            [MiddleInitial] = @MiddleInitial,
            [Email] = @Email,
            [PhoneNumber] = @PhoneNumber,
            [Address] = @Address,
            [Hobbies] = @Hobbies,
            [PhotoBase64] = CASE WHEN @PhotoBase64 IS NOT NULL THEN @PhotoBase64 ELSE [PhotoBase64] END
        WHERE
            [Id] = @Id;
    END;