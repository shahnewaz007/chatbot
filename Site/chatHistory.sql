clear screen;

drop table chatHistory;
	
create table chatHistory(chat_id int NULL,ques VARCHAR2(40) NULL,PRIMARY KEY(chat_id));
insert into chatHistory values(1, 'hi');


commit;
select * from chatHistory;