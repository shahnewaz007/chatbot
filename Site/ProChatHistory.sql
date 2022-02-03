SET VERIFY OFF;
SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE ViewChatHistory
IS
               
BEGIN
    FOR R IN (SELECT * from myView) LOOP

        DBMS_OUTPUT.PUT_LINE('------------------------------> Me: ' || R.ques);
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
            
    


END ViewChatHistory;
/
