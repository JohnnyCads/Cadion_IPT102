CREATE PROCEDURE [dbo].[DisplayProfileOption]
AS
BEGIN
    SELECT 
        [DPO].[Id] AS Id, 
        [DPO].[FirstName] AS FirstName
    FROM 
        [dbo].[Persons] AS DPO
END;