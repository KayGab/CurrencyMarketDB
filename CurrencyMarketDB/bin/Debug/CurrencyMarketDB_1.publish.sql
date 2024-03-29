﻿/*
Deployment script for CurrencyMarket

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "CurrencyMarket"
:setvar DefaultFilePrefix "CurrencyMarket"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\"

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
PRINT N'Rename refactoring operation with key 888a6225-54bf-4e40-be07-dae837edca11, 92855d01-9c23-40af-a1e3-c2a5d0d12b3c is skipped, element [dbo].[Customer].[LastName] (SqlSimpleColumn) will not be renamed to UserID';


GO
PRINT N'Rename refactoring operation with key 5572eef2-6402-422d-892b-ad75fa9e9344 is skipped, element [dbo].[Customer].[Id] (SqlSimpleColumn) will not be renamed to CustomerId';


GO
PRINT N'Rename refactoring operation with key 7500ddf8-7778-4f8a-8aef-3e5a5073ef95 is skipped, element [dbo].[Customer].[U] (SqlSimpleColumn) will not be renamed to LastName';


GO
PRINT N'Rename refactoring operation with key f7c8488b-2f05-4997-9f5b-da62bfc60953 is skipped, element [dbo].[Customer].[MiddleName] (SqlSimpleColumn) will not be renamed to MiddleInitial';


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5572eef2-6402-422d-892b-ad75fa9e9344')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5572eef2-6402-422d-892b-ad75fa9e9344')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '888a6225-54bf-4e40-be07-dae837edca11')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('888a6225-54bf-4e40-be07-dae837edca11')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '92855d01-9c23-40af-a1e3-c2a5d0d12b3c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('92855d01-9c23-40af-a1e3-c2a5d0d12b3c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7500ddf8-7778-4f8a-8aef-3e5a5073ef95')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7500ddf8-7778-4f8a-8aef-3e5a5073ef95')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f7c8488b-2f05-4997-9f5b-da62bfc60953')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f7c8488b-2f05-4997-9f5b-da62bfc60953')

GO

GO
PRINT N'Update complete.';


GO
