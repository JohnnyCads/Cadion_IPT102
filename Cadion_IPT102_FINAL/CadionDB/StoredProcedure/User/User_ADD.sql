CREATE PROCEDURE [dbo].[User_ADD]
	@Password NVARCHAR(50) , 
    @Username NVARCHAR(50) , 
    @Class NVARCHAR(50)
AS
BEGIN
INSERT INTO [dbo].[User]
(
[Password],
[Username],
[Class]
)
VALUES
(
@Password,
@Username,
@Class
)

END