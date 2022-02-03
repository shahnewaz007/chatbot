SET VERIFY OFF;
SET SERVEROUTPUT ON;

drop view myChatView;
create or replace view myChatView(ID, ques, ans) as SELECT C.chat_ID , C.ques, D.Ans FROM chatHistory@site1 C, chatHistory2 D WHERE C.chat_ID = D.chat_ID;





CREATE OR REPLACE PROCEDURE ChatHistory
IS
	ques VARCHAR2(40);
	
	
BEGIN

    FOR R IN (SELECT * from myChatView) LOOP

        DBMS_OUTPUT.PUT_LINE('------------------------------> User: ' || R.ques);
        DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: ' || R.Ans);

    END LOOP;

    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Many rows detected');
         WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Data not found');
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Other errors'); 

	

    

    DBMS_OUTPUT.PUT_LINE('Hello Procedure chatHisotry');
END ChatHistory;
/





    

	



