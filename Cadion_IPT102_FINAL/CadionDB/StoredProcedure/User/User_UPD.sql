CREATE PROCEDURE [dbo].[User_UPD]
	@Password NVARCHAR(50) , 
    @Username NVARCHAR(50) , 
    @Class NVARCHAR(50),
    	@Id INT

AS
BEGIN
UPDATE [dbo].[User]
SET
[Password] = COALESCE(@Password,[Password]),
[Username] = COALESCE(@Username,[Username]),
[Class] = COALESCE(@Class,[Class])

WHERE
[Id]=@Id

END