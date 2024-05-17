CREATE PROCEDURE [dbo].[Vape_ADD]
	@Name NVARCHAR(50), 
    @CourseYear NVARCHAR(50), 
    @Title NVARCHAR(50)
AS
BEGIN
INSERT INTO [dbo].[Vape]
(
[Name],
[Course/Year],
[Title]
)
VALUES
(
@Name,
@CourseYear,
@Title
)

END