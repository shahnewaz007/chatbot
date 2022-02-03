SET VERIFY OFF;
SET SERVEROUTPUT ON;

@"G:\Education\CSE 4.1\DDS lab\Distributed Database Lab\Lab Project\Intro.sql"
@"G:\Education\CSE 4.1\DDS lab\Distributed Database Lab\Lab Project\viewDB.sql"
@"G:\Education\CSE 4.1\DDS lab\Distributed Database Lab\Lab Project\ViewChatHistory.sql"



accept x char prompt '------------------------------> Me: '





DECLARE
    UserInput VARCHAR2(40);
    Large_input EXCEPTION;
    Wrong_input EXCEPTION;

	
	
BEGIN

    UserInput := '&x';

    IF length(UserInput)>30 THEN
		RAISE Large_input;
	END IF;



    


    CASE
        WHEN LOWER(UserInput) = 'view db' THEN
            ViewDB;
        WHEN LOWER(UserInput) = 'chat history' THEN
            ChatHistory;
        ELSE
            RAISE Wrong_input;

    END CASE;

    

     EXCEPTION
        WHEN Large_input THEN
            DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: Please input small text');
        WHEN Wrong_input THEN
            DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: Wrong Command');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Many rows detected');
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Data not found');
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Other errors');




END;
/


