CREATE TABLE [dbo].[tblGamePlayer] (
    [GamePlayerID] INT IDENTITY (1, 1) NOT NULL,
    [GameID]       INT NOT NULL,
    [PlayerID]     INT NOT NULL,
    CONSTRAINT [PK_tblGamePlayer] PRIMARY KEY CLUSTERED ([GamePlayerID] ASC),
    CONSTRAINT [FK_tblGamePlayer_tblGame] FOREIGN KEY ([GameID]) REFERENCES [dbo].[tblGame] ([GameID]),
    CONSTRAINT [FK_tblGamePlayer_tblPlayer] FOREIGN KEY ([PlayerID]) REFERENCES [dbo].[tblPlayer] ([PlayerID])
);

