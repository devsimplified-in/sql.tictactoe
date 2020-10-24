CREATE TABLE [dbo].[GamePlayerPosition] (
    [GamePlayerPositionID] INT IDENTITY (1, 1) NOT NULL,
    [GamePlayerID]         INT NOT NULL,
    [PositionID]           INT NOT NULL,
    CONSTRAINT [PK_GamePlayerPosition] PRIMARY KEY CLUSTERED ([GamePlayerPositionID] ASC),
    CONSTRAINT [FK_GamePlayerPosition_tblGamePlayer] FOREIGN KEY ([GamePlayerID]) REFERENCES [dbo].[tblGamePlayer] ([GamePlayerID]),
    CONSTRAINT [FK_GamePlayerPosition_tblPosition] FOREIGN KEY ([PositionID]) REFERENCES [dbo].[tblPosition] ([PositionID])
);

