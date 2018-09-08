CREATE TABLE [ClientCenter].[Customer]
(
	[CustomerId] BIGINT NOT NULL PRIMARY KEY, 
    [UserID] NVARCHAR(50) NULL, 
    [FirstName] NVARCHAR(100) NULL, 
    [LastName] NVARCHAR(100) NULL, 
    [MiddleInitial] CHAR(10) NULL, 
    [EMail] NVARCHAR(50) NULL, 
	[AddressID] BIGINT NULL, 
    [Status] BIT NULL, 
    [CreatedDate] DATETIME NULL, 
    [ModifiedDate] DATETIME NULL, 
    [CreatedBy] BIGINT NULL, 
    [ModifiedBy] BIGINT NULL
)
