create table customer(
CustNo varchar2(8) not null,
Custname varchar2(30) not null,
Address varchar2(30) not null,
Internal char(1) not null,
Contract varchar2(35) not null,
Phone varchar2(11) not null,
City varchar2(30) not null, 
"State" varchar2(2) not null,
Zip varchar2(10) not null,

constraint CustNo_PK primary key (CustNo)
);
create table employee(
EmpNo varchar2(8) not null,
EmpName varchar2(30) not null.
Department varchar2(20) not null,
Email varchar2(50) not null,
phone varchar2(8),

constraint EmpNo_PK primary key (EmpNo),
constraint unique_email unique (Email)
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
  create table resourcetbl(
 ResNo varchar2(8) not null,
 ResName varchar2(30) not null,
 Rate number(4,2),
 
 constraint ResNo_PK primary key (ResNo)
 );
 create table eventrequest(
 EventNo varchar2(8) not null,
 DateHeld date not null,
 DateReq date not null,
 FacNo varchar2(8) not null,
 CustNo varchar2(8) not null,
 dateauth date,
 status varchar2(15) not null,
 EstCost number(5,0) not null,
 EstAudience number(5,0) not null,
 BudNo varchar2(8),
 
 constraint EventNo_PK primary key (EventNo),
 constraint FacNo_FK_eventrequest foreign key (FacNo) references facility (FacNo),
 constraint CustNo_FK foreign key (CustNo)references customer (CustNo)
 );
 create table eventplan(
 PlanNo varchar2(8) not null,
 EventNo varchar2(8) not null,
 WorkDate date not null,
 Notes varchar2(30),
 Activity varchar2(20) not null,
 EmpNo varchar2(8),
 
 constraint PlanNo_PK primary key (PlanNo),
 constraint EventNo_FK foreign key (EventNo) references eventrequest (EventNo),
 constraint EmpNo_FK foreign key (EmpNo)references employee (EmpNo)
 );
 create table eventplanline(
 PlanNo varchar2(8) not null,
 LineNo char(1) not null,
 TimeStart date not null,
 TimeEnd date not null,
 NumberFld number(1,0) not null,
 LocNo varchar2(8) not null,
 ResNo varchar2(8) not null,
 
 constraint PlanNo_FK foreign key (PlanNo) references eventplan (PlanNo),
 constraint LocNo_FK foreign key (LocNo)references location (LocNo),
 constraint ResNo_FK foreign key (ResNo)references resourcetbl (ResNo) 
 );