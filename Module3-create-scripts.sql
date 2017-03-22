create table customer(
CustNo varchar2(8) not null,
Custname varchar2(30) not null,
Address varchar2(30) not null,
Internal char(1) not null,
Contract varchar2(35) not null,
Phone varchar2(11) not null,
City varchar2(30) not null, 
'State' varchar2(2) not null,
Zip varchar2(10) not null,

constraint CustNo_PK primary key (CustNo)
);
 create table facility(
 FacNo varchar2(8) not null,
 FacName varchar2(30) not null,
 
 constraint FacNo_PK primary key (FacNo),
 constraint FacName_Unique unique (FacName)
 );
 create table location(
 LocNo varchar2(8)not null,
 FacNo varchar2(8)not null,
 LocName varchar2(30) not null,
 
 constraint LocNo_PK primary key (LocNo),
 constraint FacNo_FK foreign key (FacNo) references facility (FacNo)
 );