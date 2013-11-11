-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================================
-- Author:		Sola Oderinde
-- Create date: 7 Nov 2013
-- Description:	Return election Race result for all regions
-- =================================================================================
CREATE PROCEDURE GetRaceResult
	@RaceID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
		R.RaceID
		,C.CandidateId, C.FirstName, C.LastName
		,P.Name as PartyName
		,p.Acronym AS PartyAcronym
		,SUM(RR.NoOfVotes) as TotalVotes
	FROM
		RaceResult RR
		LEFT JOIN Candidate C on  RR.CandidateId = C.CandidateId 
		LEFT JOIN Party P on C.PartyID = P.PartyID
		LEFT JOIN Race R on RR.RaceId = R.RaceId
	WHERE 
		R.RaceID = @RaceID
	GROUP BY 
		R.RaceID
		,C.CandidateId, C.FirstName, C.LastName
		,P.Name ,p.Acronym 
		
END
GO
