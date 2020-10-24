CREATE TABLE [dbo].[tblPosition] (
    [PositionID]   INT          NOT NULL,
    [PositionCode] VARCHAR (50) NOT NULL,
    [XCordinate]   INT          NOT NULL,
    [YCordinate]   INT          NOT NULL,
    CONSTRAINT [PK_tblPosition_1] PRIMARY KEY CLUSTERED ([PositionID] ASC)
);

