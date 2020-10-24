CREATE PROCEDURE [dbo].[uspCleanAndLoadMasterData2]
as
BEGIN

DELETE FROM GamePlayerPosition
DELETE FROM tblGamePlayer
DELETE FROM tblPlayer
DELETE FROM tblPosition




INSERT INTO tblPosition(PositionID,PositionCode,XCordinate,YCordinate)

SELECT 1 AS PositionID, 'A1' AS PositionCode,	1 AS XCordinate, 1 AS YCordinate UNION ALL 
SELECT 2 AS PositionID, 'A2' AS PositionCode,	1 AS XCordinate, 2 AS YCordinate UNION ALL 
SELECT 3 AS PositionID, 'A3' AS PositionCode,	1 AS XCordinate, 3 AS YCordinate UNION ALL 
	   		
SELECT 4 AS PositionID, 'B1' AS PositionCode,	2 AS XCordinate, 1 AS YCordinate UNION ALL 
SELECT 5 AS PositionID, 'B2' AS PositionCode,	2 AS XCordinate, 2 AS YCordinate UNION ALL 
SELECT 6 AS PositionID, 'B3' AS PositionCode,	2 AS XCordinate, 3 AS YCordinate UNION ALL 
	   		
SELECT 7 AS PositionID, 'C1' AS PositionCode,	3 AS XCordinate, 1 AS YCordinate UNION ALL 
SELECT 8 AS PositionID, 'C2' AS PositionCode,	3 AS XCordinate, 2 AS YCordinate UNION ALL 
SELECT 9 AS PositionID, 'C3' AS PositionCode,	3 AS XCordinate, 3 AS YCordinate 


INSERT INTO tblPlayer(Name,UserID)
SELECT 'Rahul' Name,'Rahul1986' AS UserID UNION ALL 
SELECT 'Manish' Name,'Man5489' AS UserID 


Insert into tblGame(Name)
SELECT 'NewGame1256' AS Name

INSERT INTO tblGamePlayer(GameID,PlayerID)
SELECT tblGame.GameID, tblPlayer.PlayerID 
FROM	tblPlayer
		CROSS JOIN tblGame

END