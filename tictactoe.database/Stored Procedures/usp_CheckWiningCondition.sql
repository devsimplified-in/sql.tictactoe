CREATE PROC usp_CheckWiningCondition
AS
BEGIN
		
		SELECT PatternMatch
		FROM(
		SELECT 'R1' PatternMatch,GamePlayerID, 1 AS PatternCont 
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('A1','A2','A3') AND GamePlayerPosition.GamePlayerID IS NOT NULL
			
		UNION ALL
		SELECT 'R2' PatternMatch,GamePlayerID, 1 AS PatternCont   
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('B1','B2','B3') AND GamePlayerPosition.GamePlayerID IS NOT NULL
			
		UNION ALL
		SELECT 'R3' PatternMatch,GamePlayerID, 1 AS PatternCont  
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('C1','C2','C3') AND GamePlayerPosition.GamePlayerID IS NOT NULL
			
		UNION ALL
		SELECT 'C1' PatternMatch,GamePlayerID, 1 AS PatternCont   
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('A1','B1','C1') AND GamePlayerPosition.GamePlayerID IS NOT NULL
			
		UNION ALL
		SELECT 'C2' PatternMatch,GamePlayerID, 1 AS PatternCont   
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('A2','B2','C2') AND GamePlayerPosition.GamePlayerID IS NOT NULL
			
		UNION ALL
		SELECT 'C3' PatternMatch,GamePlayerID, 1 AS PatternCont   
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('A3','B3','C3') AND GamePlayerPosition.GamePlayerID IS NOT NULL
			
		UNION ALL
		SELECT 'D1' PatternMatch,GamePlayerID, 1 AS PatternCont   
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('A1','B2','C3') AND GamePlayerPosition.GamePlayerID IS NOT NULL
			
		UNION ALL
		SELECT 'D2' PatternMatch,GamePlayerID, 1 AS PatternCont   
		FROM	tblPosition
				INNER JOIN GamePlayerPosition
				ON GamePlayerPosition.PositionID = tblPosition.PositionID
		WHERE	tblPosition.PositionCode IN ('A3','B2','C1') AND GamePlayerPosition.GamePlayerID IS NOT NULL
		)OBJ
		GROUP BY PatternMatch,GamePlayerID
		HAVING COUNT(PatternCont) =3
			

END