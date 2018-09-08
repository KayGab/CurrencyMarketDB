CREATE TABLE [AccountManagement].[Account]
(
	[AccountId] BIGINT NOT NULL PRIMARY KEY, 
    [AccountName] NVARCHAR(256) NULL, 
    [CurrencyID] INT NULL, 
	[Balance]   DECIMAL(10,2),
	[Status]    BIT,
    [CreatedDate] DATETIME NULL, 
    [ModifiedDate] DATETIME NULL
)