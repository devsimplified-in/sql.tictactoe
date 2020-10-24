CREATE TABLE [dbo].[tblGame] (
    [GameID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tblGame] PRIMARY KEY CLUSTERED ([GameID] ASC)
);

