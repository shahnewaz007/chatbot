SET VERIFY OFF;
SET SERVEROUTPUT ON;

 @"C:\Users\ayonm\Desktop\DDS Project\trigger.sql"
 @"C:\Users\ayonm\Desktop\DDS Project\ProChatHistory.sql"
 @"C:\Users\ayonm\Desktop\DDS Project\TeachBot.sql"




drop view myView;
create or replace view myView(ID, ques, ans) as SELECT C.chat_ID , C.ques, D.Ans FROM chatHistory C, chatHistory2@server1 D WHERE C.chat_ID = D.chat_ID;

accept x char prompt '------------------------------> Me: '




CREATE OR REPLACE PACKAGE mainpack AS

	FUNCTION inputQues(A VARCHAR2)
	RETURN VARCHAR2;

    PROCEDURE Chatting(A VARCHAR2);	
	
END mainpack;
/





CREATE OR REPLACE PACKAGE BODY mainpack AS

	FUNCTION inputQues(A IN VARCHAR2)
	RETURN VARCHAR2
	IS
		
        NUM int := 1;
        firstWord VARCHAR2(40);
        B VARCHAR2(40);
        flag Number := 0;


	BEGIN

       
		LOOP
            SELECT REGEXP_SUBSTR(A , '[^ ]+' , 1 , NUM) into B FROM dual;
            IF B IS NULL THEN 
                EXIT;
            END IF;

            firstWord :=  B;
            flag := 1;
            NUM := NUM + 1;

            IF flag = 1 THEN
                EXIT;
            END IF;

        END LOOP;


        

		return firstWord;

        EXCEPTION
	        WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('Many rows detected');
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Data not found');
            WHEN ZERO_DIVIDE THEN
                DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Other errors');


	END inputQues;










    PROCEDURE Chatting(A VARCHAR2)
	IS
		Ans VARCHAR2(40) :='No';
        random pls_integer;
        count1 NUMBER := 0;
        rowCount NUMBER;

        NUM int := 1;
        stringChecker VARCHAR2(40) := '%';
        B VARCHAR2(40);
        

	BEGIN

        select chat_ID into rowCount from chatHistory where ROWNUM=1 order by chat_ID desc;
    
        insert into chatHistory values(rowCount+1, A);


        LOOP
            SELECT REGEXP_SUBSTR(A , '[^ ]+' , 1 , NUM) into B FROM dual;
            IF B IS NULL THEN 
                EXIT;
            END IF;

            stringChecker := stringChecker || B || '%';
            NUM := NUM + 1;

            
        END LOOP;  
        
        
        FOR R IN (SELECT ans1,ans2 FROM QuesAns@server1 where ques like stringChecker ) LOOP
    
            
            random := dbms_random.value(1,2);

            IF random = 1 THEN
                 Ans := R.ans1;
            ELSE
                 Ans := R.ans2;
            END IF;

            DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: '||Ans);

            count1 := count1 + 1;

            IF count1 = 1 THEN
                    EXIT;
            END IF;
            

        END LOOP;

        
   
        
        IF Ans = 'No' THEN
        
            FOR R IN (SELECT ans1,ans2,UTL_MATCH.jaro_winkler_similarity(ques, LOWER(A)) AS jws FROM   QuesAns@server1 ORDER BY jws desc) LOOP
        
                IF R.jws > 90 THEN
                    random := dbms_random.value(1,2);

                    IF random = 1 THEN
                        Ans := R.ans1;
                    ELSE
                        Ans := R.ans2;
                    END IF;

                    DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: '||Ans);

                    count1 := count1 + 1;
                END IF;


                
                IF count1 = 1 THEN
                    EXIT;
                END IF;


            END LOOP;

        END IF;


        IF count1 = 0 THEN
            DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: Not sure waht you are asking! Can you teach me the answer? command: teach ans ');
        END IF;


        select chat_ID into rowCount from chatHistory where ROWNUM=1 order by chat_ID desc;
    
        insert into chatHistory2@server1 values(rowCount, Ans);

        EXCEPTION
	        WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('Many rows detected');
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Data not found');
            WHEN ZERO_DIVIDE THEN
                DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Other errors');
        

        
		
		
	END Chatting;




        

	
	
END mainpack;
/









DECLARE
	UserInput VARCHAR2(40);
    Ans VARCHAR2(40);
    Command VARCHAR2(40);
    prev_ques VARCHAR2(40);
    random pls_integer;
    Large_question EXCEPTION;
    
    
	
BEGIN

   
    UserInput := '&x';

    IF length(UserInput)>40 THEN
		RAISE Large_question;
	END IF;



    

    Command := mainpack.inputQues(LOWER(UserInput));

    CASE
        WHEN Command = 'teach' THEN
            Teach(UserInput);
        WHEN Command = 'history' THEN
            ViewChatHistory;
        ELSE
            mainpack.Chatting(UserInput);

    END CASE;


    


    EXCEPTION
	WHEN Large_question THEN
		DBMS_OUTPUT.PUT_LINE('------------------------------> Bot: Please input small text');
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




 
