
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/04/2020 00:45:45
-- Generated from EDMX file: C:\Users\hillc\Documents\Visual Studio\Projects\1714CHill\1714chill2h\BaseballModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BaseballGame];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[Innings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Innings];
GO
IF OBJECT_ID(N'[dbo].[Games]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Zip] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Games'
CREATE TABLE [dbo].[Games] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartDateTime] nvarchar(max)  NOT NULL,
    [Location_Id] int  NOT NULL,
    [Umpire_Id] int  NOT NULL,
    [Team1Id_Id] int  NOT NULL,
    [Team2Id_Id] int  NOT NULL
);
GO

-- Creating table 'Innings'
CREATE TABLE [dbo].[Innings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Team1Score] nvarchar(max)  NOT NULL,
    [Team2Score] nvarchar(max)  NOT NULL,
    [Game_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [PK_Games]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Innings'
ALTER TABLE [dbo].[Innings]
ADD CONSTRAINT [PK_Innings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Location_Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [FK_LocationGame]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationGame'
CREATE INDEX [IX_FK_LocationGame]
ON [dbo].[Games]
    ([Location_Id]);
GO

-- Creating foreign key on [Game_Id] in table 'Innings'
ALTER TABLE [dbo].[Innings]
ADD CONSTRAINT [FK_GameInning]
    FOREIGN KEY ([Game_Id])
    REFERENCES [dbo].[Games]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GameInning'
CREATE INDEX [IX_FK_GameInning]
ON [dbo].[Innings]
    ([Game_Id]);
GO

-- Creating foreign key on [Umpire_Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [FK_PersonGame]
    FOREIGN KEY ([Umpire_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonGame'
CREATE INDEX [IX_FK_PersonGame]
ON [dbo].[Games]
    ([Umpire_Id]);
GO

-- Creating foreign key on [Team1Id_Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [FK_PersonGame1]
    FOREIGN KEY ([Team1Id_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonGame1'
CREATE INDEX [IX_FK_PersonGame1]
ON [dbo].[Games]
    ([Team1Id_Id]);
GO

-- Creating foreign key on [Team2Id_Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [FK_PersonGame2]
    FOREIGN KEY ([Team2Id_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonGame2'
CREATE INDEX [IX_FK_PersonGame2]
ON [dbo].[Games]
    ([Team2Id_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------