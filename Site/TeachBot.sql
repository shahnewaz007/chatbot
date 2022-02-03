SET VERIFY OFF;
SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE Teach(Ans VARCHAR2)
IS
    row_Num NUMBER := 0;

    prevQuestion VARCHAR2(40);
    Temp_row_Num NUMBER := 0;
    TrimmedAns VARCHAR2(40); 
           
            

BEGIN

    TrimmedAns:= SUBSTR(Ans, 6);


    select chat_ID into Temp_row_Num from chatHistory where ROWNUM=1 order by chat_ID desc;


    select ques into prevQuestion from chatHistory where chat_ID=Temp_row_Num;

            

    select Ques_ID into row_Num from QuesAns@server1 where ROWNUM=1 order by QUES_ID desc;


            

    insert into QuesAns@server1 values(row_Num+1,prevQuestion,TrimmedAns,TrimmedAns);

          

    DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: Just learned a new thing! I am becomming intelligent! Thank you :D');



    EXCEPTION
	    WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Many rows detected');
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Data not found');
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Other errors');
                        
            
    
END Teach;
/
