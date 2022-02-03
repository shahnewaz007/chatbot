SET VERIFY OFF;
SET SERVEROUTPUT ON;


DECLARE
    UserInput VARCHAR2(40);
    Large_input EXCEPTION;
    Wrong_input EXCEPTION;

	
	
BEGIN

    DBMS_OUTPUT.PUT_LINE('.');
    DBMS_OUTPUT.PUT_LINE('.');


    DBMS_OUTPUT.PUT_LINE('Welcome to chatBot Admin panel');
    DBMS_OUTPUT.PUT_LINE('===============================');

    DBMS_OUTPUT.PUT_LINE('.');
    DBMS_OUTPUT.PUT_LINE('.');

    DBMS_OUTPUT.PUT_LINE('========= Command List ======');
    DBMS_OUTPUT.PUT_LINE('.');
    DBMS_OUTPUT.PUT_LINE('view DB         ---> View all question answer database');
    DBMS_OUTPUT.PUT_LINE('Chat History    ---> View all chat History with users');



END;
/
