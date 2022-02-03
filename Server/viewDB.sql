SET VERIFY OFF;
SET SERVEROUTPUT ON;

drop view myView;
create or replace view myView(ID, ques, ans1, ans2) as SELECT ques_id, ques, ans1, ans2  FROM QuesAns;


CREATE OR REPLACE PROCEDURE ViewDB
IS
	ques VARCHAR2(40);
	
	
BEGIN

    FOR R IN (SELECT ID, ques, ans1, ans2 from myView) LOOP
       
        DBMS_OUTPUT.PUT_LINE(R.ID||'. '|| R.ques);
        DBMS_OUTPUT.PUT_LINE('Ans 1 : '|| R.ans1);
        DBMS_OUTPUT.PUT_LINE('Ans 2 : '|| R.ans2);
        DBMS_OUTPUT.PUT_LINE('.');


    END LOOP;


    DBMS_OUTPUT.PUT_LINE('Hello Procedure ViewDB');
END ViewDB;
/





    

	



