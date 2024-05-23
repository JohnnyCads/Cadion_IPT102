CREATE PROCEDURE [dbo].[User_SEA]
	    @Key NVARCHAR(50) 
AS
BEGIN
SELECT
[Password] as  Password,
[Username] as Username ,
[Class] as  Class
FROM [dbo].[User]
WHERE
[Password] like @Key
or
[Username] like @Key
or
[Class] like @Key
order by [Username]
END