/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     2019/1/25 16:59:44                           */
/*==============================================================*/


alter table "order"
   drop constraint FK_ORDER_REFERENCE_D_USER;

drop table d_user cascade constraints;

drop table "order" cascade constraints;

/*==============================================================*/
/* Table: d_user                                                */
/*==============================================================*/
create table d_user  (
   id                   VARCHAR2(30 BYTE)               not null,
   username             VARCHAR2(50 BYTE),
   password             VARCHAR2(50 BYTE),
   age                  NUMBER(3),
   price                NUMBER(10,2),
   constraint PK_D_USER primary key (id)
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table "order"  (
   id                   VARCHAR2(30 BYTE)               not null,
   name                 VARCHAR2(50 BYTE),
   type                 VARCHAR2(20 BYTE),
   address              VARCHAR2(50 BYTE),
   zip                  NUMBER(10),
   user_id              VARCHAR2(30 BYTE),
   constraint PK_ORDER primary key (id)
);

alter table "order"
   add constraint FK_ORDER_REFERENCE_D_USER foreign key (user_id)
      references d_user (id);

