Create PROC dbo.pCreateTable(@TableName VARCHAR(max))
AS
BEGIN	
BEGIN TRY
DECLARE @tablescript VARCHAR(max)

SET @tablescript = 'CREATE TABLE [dbo].' + @TableName + '(
CreatedDate DATETIME NOT NULL,
CreatedBy INT NULL,
UpdatedDate DATETIME NULL,
UpdatedBy INT NULL,
IsActive BIT
	)'

EXEC sp_executesql @tablescript

END TRY
BEGIN CATCH
    PRINT 'In CATCH Block'
    IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN;
END CATCH



END
GO
