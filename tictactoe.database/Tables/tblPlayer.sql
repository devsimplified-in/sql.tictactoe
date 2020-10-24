CREATE TABLE [dbo].[tblPlayer] (
    [PlayerID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (50) NOT NULL,
    [UserID]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tblPlayer] PRIMARY KEY CLUSTERED ([PlayerID] ASC)
);

