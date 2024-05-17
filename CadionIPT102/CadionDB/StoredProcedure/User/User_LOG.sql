CREATE PROCEDURE [dbo].[User_LOG]
	   @Password NVARCHAR(50) , 
    @Username NVARCHAR(50) 
AS
BEGIN
SELECT
[Class] as  Class

FROM [dbo].[User]

WHERE
[Password] like @Password
and
[Username] like @Username

END