SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER TeachTrigger 
AFTER INSERT 
ON QuesAns
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Just learned a new thing! I am becomming intelligent! Thank you :D');
END;
/
