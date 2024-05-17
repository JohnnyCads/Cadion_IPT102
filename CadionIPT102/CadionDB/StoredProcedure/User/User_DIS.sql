CREATE PROCEDURE [dbo].[User_DIS]
AS
BEGIN
if(select count(*)from[dbo].[User])=0
begin
INSERT INTO [dbo].[User]
(
[Password],
[Username],
[Class]
)
VALUES
(
N'Admin',
N'Admin',
N'Admin'
)

end
if(select count(*)from[dbo].[Vape])=0
begin
INSERT INTO [dbo].[Vape]
(
[Name],
[Course/Year],
[Title]
)
VALUES
(
N'VGOD',
N'BlackCurrant',
N'20mg'
)

end
SELECT
[Password] as Password,
[Username] as Username,
[Class] as  Class,
[Id] as Id
FROM [dbo].[User]

END

