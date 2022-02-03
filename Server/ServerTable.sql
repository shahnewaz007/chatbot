
clear screen;

drop table QuesAns;
	
create table QuesAns(ques_id int NULL,ques VARCHAR2(40) NOT NULL,ans1 VARCHAR2(40) NULL, ans2 VARCHAR2(40) NULL,PRIMARY KEY(ques_id));
    
insert into QuesAns values(1,'hi','Hello!!','Whats up?');
insert into QuesAns values(2,'how are you?','Great!!','Fine! U?');
insert into QuesAns values(3,'what are you doing?','Talking to you!!','umm! nothing Special');
insert into QuesAns values(4,'do you know me','yupp!!','you are a human');
insert into QuesAns values(5,'who are you','I am a chat bot','I am your assistant');
insert into QuesAns values(6,'who am i?','you are a human','human from earth!!');
insert into QuesAns values(7,'i am good','glad to hear that','that is great!!');
insert into QuesAns values(8,'i am upset','why!?','i am sorry');
insert into QuesAns values(9,'okay','yeah','yupp');
insert into QuesAns values(10,'i love it','really!','yes! I know you will like it');
insert into QuesAns values(11,'hi, how are you doing?','i am fine. how about yourself?','i am pretty good. thanks for asking');
insert into QuesAns values(12,'i have been good','glad to hear that','that is great!!');
insert into QuesAns values(13,'how is it going','i am doing well. how about you?','never better, thanks');
insert into QuesAns values(14,'it is an ugly day today','i know. i think it may rain','i know');
insert into QuesAns values(15,'you are right.','thanks','yupp');
insert into QuesAns values(16,'no problem','okay','yeah');
insert into QuesAns values(17,'who made you','Ayon made me','Ayon');



commit;
select * from QuesAns;