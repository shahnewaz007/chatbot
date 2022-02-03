CREATE OR REPLACE TRIGGER HistoryTrigger 
AFTER INSERT 
ON chatHistory
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('History Added! Command: history');
END;
/