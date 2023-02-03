create table myboard (
	idx int not null auto_increment,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

insert into myboard(title,content,writer,indate)
values ("ㅎㅇㅎㅇ","헬로우","자바",now())

insert into myboard(title,content,writer,indate)
values ("ㅎㅇ","헬로우","자바",now())


select * from myboard

create table mem_tbl(
	memIdx int auto_increment,
	memID varchar(20) not null,
	memPassword varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(50),
	memProfile varchar(50),
	primary key(memIdx)
);



