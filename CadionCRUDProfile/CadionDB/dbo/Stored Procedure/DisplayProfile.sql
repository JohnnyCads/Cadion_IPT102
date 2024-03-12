CREATE PROCEDURE [dbo].[DisplayProfile]
	@PersonId int

AS
BEGIN
    SELECT 
        [DPO].[Id] AS Id, 
        [DPO].[FirstName] AS FirstName,
        [DPO].[SureName] AS SureName,
        [DPO].[MiddleInitial] AS MiddleInitial,
        [DPO].[Email] AS Email,
        [DPO].[PhoneNumber] AS PhoneNumber,
        [DPO].[Address] AS Address,
        [DPO].[Hobbies] AS Hobbies,
        [DPO].[PhotoBase64] AS PhotoBase64
    FROM 
        [dbo].[Persons] AS DPO
    WHERE [DPO].[Id] = Id;
END;
