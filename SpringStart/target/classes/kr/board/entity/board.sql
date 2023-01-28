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


select * from myboard



