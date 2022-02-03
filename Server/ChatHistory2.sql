clear screen;

drop table chatHistory2;
	
create table chatHistory2(chat_id int NULL,ans VARCHAR2(40) NULL);
insert into chatHistory2 values(1, 'hello');


commit;
select * from chatHistory2;