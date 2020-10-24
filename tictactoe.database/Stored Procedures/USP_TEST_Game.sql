CREATE  Procedure [dbo].[USP_TEST_Game]
AS
BEGIN

EXEC uspCleanAndLoadMasterData2
Declare @GamePlayerID_ONE INT
Declare @GamePlayerID_TWO INT
Declare @PositionID INT


SELECT @GamePlayerID_ONE = GamePlayerID FROM tblGamePlayer ORDER BY GamePlayerID
SELECT @GamePlayerID_TWO = GamePlayerID FROM tblGamePlayer ORDER BY GamePlayerID DESC
DECLARE @PLAYER_ONE BIT = 1

WHILE EXISTS(
			SELECT PositionID FROM tblPosition
			EXCEPT
			SELECT	PositionID 
			FROM	GamePlayerPosition 
			WHERE	GamePlayerID = @GamePlayerID_ONE
					OR
					GamePlayerID = @GamePlayerID_TWO

)
BEGIN

			INSERT INTO GamePlayerPosition
			(
				GamePlayerID,
				PositionID
			)
			SELECT TOP (1) 
					CASE WHEN @PLAYER_ONE = 1 
						THEN @GamePlayerID_ONE
						ELSE @GamePlayerID_TWO
					END AS GamePlayerID,
					OBJ.PositionID 
			FROM(
					SELECT PositionID FROM tblPosition
					EXCEPT
					SELECT	PositionID 
					FROM	GamePlayerPosition 
					WHERE	GamePlayerID = @GamePlayerID_ONE
							OR
							GamePlayerID = @GamePlayerID_TWO
			)OBJ
			ORDER BY NEWID()
			SET @PLAYER_ONE = CASE WHEN @PLAYER_ONE =1 THEN 0 ELSE 1 END

			--SELECT @PLAYER_ONE
			

END

EXEC usp_CheckWiningCondition

SELECT * 
FROM(
		SELECT	tblPosition.XCordinate,
				tblPosition.YCordinate,
				GamePlayerPosition.GamePlayerID
		FROM	GamePlayerPosition
				INNER JOIN tblPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
)OBJ
PIVOT (
		MAX(GamePlayerID)
		FOR YCordinate IN(
		[1],[2],[3]
		)
)AS pivot_table;


END