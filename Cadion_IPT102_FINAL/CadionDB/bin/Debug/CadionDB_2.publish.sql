﻿/*
Deployment script for CadionDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "CadionDB"
:setvar DefaultFilePrefix "CadionDB"
:setvar DefaultDataPath "C:\Users\JERICHO\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\JERICHO\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
The column [dbo].[Vape].[Type] is being dropped, data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[Vape])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'The following operation was generated from a refactoring log file 6e5adc21-c6e8-4937-ae96-a5b448b42b37';

PRINT N'Rename [dbo].[Vape].[Course/Year] to Flavor';


GO
EXECUTE sp_rename @objname = N'[dbo].[Vape].[Course/Year]', @newname = N'Flavor', @objtype = N'COLUMN';


GO
PRINT N'The following operation was generated from a refactoring log file 9726c4c2-5c52-45ba-883e-36d47133ab26';

PRINT N'Rename [dbo].[Vape].[Title] to Type';


GO
EXECUTE sp_rename @objname = N'[dbo].[Vape].[Title]', @newname = N'Type', @objtype = N'COLUMN';


GO
PRINT N'Altering Table [dbo].[Vape]...';


GO
ALTER TABLE [dbo].[Vape] DROP COLUMN [Type];


GO
ALTER TABLE [dbo].[Vape]
    ADD [Milligrams] NVARCHAR (50) NULL;


GO
PRINT N'Altering Procedure [dbo].[User_DIS]...';


GO
ALTER PROCEDURE [dbo].[User_DIS]
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
[Flavor],
[Milligrams]
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
GO
PRINT N'Altering Procedure [dbo].[Vape_ADD]...';


GO
ALTER PROCEDURE [dbo].[Vape_ADD]
	@Name NVARCHAR(50), 
    @Flavor NVARCHAR(50), 
    @Milligrams NVARCHAR(50)
AS
BEGIN
INSERT INTO [dbo].[Vape]
(
[Name],
[Flavor],
[Milligrams]
)
VALUES
(
@Name,
@Flavor,
@Milligrams
)

END
GO
PRINT N'Altering Procedure [dbo].[Vape_DIS]...';


GO
ALTER PROCEDURE [dbo].[Vape_DIS]
		AS
BEGIN
SELECT
[Id] as Id,
[Name] as Name,
[Flavor] as Flavor,
[Milligrams] as Milligrams

FROM [dbo].[Vape]


END
GO
PRINT N'Altering Procedure [dbo].[Vape_Sea]...';


GO
ALTER PROCEDURE [dbo].[Vape_Sea]
	@key NVARCHAR(50)

AS
BEGIN
SELECT
[Id] as Id,
[Name] as Name,
[Flavor] as Flavor,
[Milligrams] as Type

FROM [dbo].[Vape]

WHERE 
[Id] like @key or
[Name] like @key or
[Flavor] like @key or
[Milligrams] like @key 

ORDER BY [Name]
END
GO
PRINT N'Altering Procedure [dbo].[Vape_UPD]...';


GO
ALTER PROCEDURE [dbo].[Vape_UPD]
	    @Id INT,
    @Name NVARCHAR(50), 
    @Flavor NVARCHAR(50), 
    @Milligrams NVARCHAR(50)

AS

BEGIN
UPDATE [dbo].[Vape]
SET
[Name] =coalesce(@Name,[Name]) ,
[Flavor] = coalesce(@Flavor,[Flavor]) ,
[Milligrams] =coalesce(@Milligrams,[Milligrams]) 
WHERE [Id]=@Id

END
GO
PRINT N'Refreshing Procedure [dbo].[Vape_DEL]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Vape_DEL]';


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6e5adc21-c6e8-4937-ae96-a5b448b42b37')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6e5adc21-c6e8-4937-ae96-a5b448b42b37')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9726c4c2-5c52-45ba-883e-36d47133ab26')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9726c4c2-5c52-45ba-883e-36d47133ab26')

GO

GO
PRINT N'Update complete.';


GO
