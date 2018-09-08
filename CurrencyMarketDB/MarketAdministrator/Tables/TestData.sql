CREATE TABLE [MarketAdministrator].[TestData] (
    [Id]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (250) NULL,
    [Value]     NVARCHAR (250) NULL,
    [DateAdded] DATETIME       NULL,
    CONSTRAINT [PK_Admin.TestData] PRIMARY KEY CLUSTERED ([Id] ASC)
);

