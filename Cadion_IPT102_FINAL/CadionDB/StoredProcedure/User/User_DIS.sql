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
[VapeType],
[Price]
)
VALUES
(
N'Black Elite',
N'Disposable',
N'550'
)

end
if(select count(*)from[dbo].[Juice])=0
begin
INSERT INTO [dbo].[Juice]
(
[BrandName],
[Flavor],
[Price]
)
VALUES
(
N'Special Orders',
N'Strawberry Ice Cream',
N'350'
)

end
SELECT
[Password] as Password,
[Username] as Username,
[Class] as  Class,
[Id] as Id
FROM [dbo].[User]

END

