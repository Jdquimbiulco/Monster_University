/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16/11/2025 19:39:07                          */
/*==============================================================*/


drop table if exists AEASI_ASIGN;

drop table if exists AECAR_CARRER;

drop table if exists AEEST_ESTUD;

drop table if exists AEGRU_GRUPO;

drop table if exists AEPER_PERIOD;

drop table if exists FEDEU_DEUDA;

drop table if exists FEPAG_PAGO;

drop table if exists PEASI_ASIGNACION_ROL;

drop table if exists PECAR_CARGO;

drop table if exists PEDOC_DOCEN;

drop table if exists PEEMP_EMPLE;

drop table if exists PEESC_ESTCIV;

drop table if exists PEROL_INSTITUCIONAL;

drop table if exists PESEX_SEXO;

drop table if exists XEEST_ESTAD;

drop table if exists XEOPC_OPCIO;

drop table if exists XEOXP_OPCPE;

drop table if exists XEPER_PERFI;

drop table if exists XESIS_SISTE;

drop table if exists XEUSU_USUAR;

drop table if exists XEUXP_USUPE;

/*==============================================================*/
/* Table: AEASI_ASIGN                                           */
/*==============================================================*/
create table AEASI_ASIGN
(
   AEASI_ID             varchar(10) not null,
   AEA_AEASI_ID         varchar(10),
   AEASI_CODIGO         varchar(10),
   AEASI_NOMBRE         varchar(20),
   AEASI_CREDITOS       int,
   DESCRIPCIONASIGNATURA varchar(100),
   ARASRTIPO            varchar(10),
   primary key (AEASI_ID)
);

alter table AEASI_ASIGN comment 'Entidad que se utiliza para almacenar las asignaturas.';

/*==============================================================*/
/* Table: AECAR_CARRER                                          */
/*==============================================================*/
create table AECAR_CARRER
(
   IDCARRERA            varchar(10) not null,
   NOMBRECARRERA        varchar(20) not null,
   CODIGOCARRERA        varchar(10) not null,
   MAX_CREDITOSCARRERA  numeric(24,0) not null,
   MIN_CREDITOSCARRERA  numeric(12,0) not null,
   primary key (IDCARRERA)
);

alter table AECAR_CARRER comment 'Entidad que representa las carreras o programas académicos. ';

/*==============================================================*/
/* Table: AEEST_ESTUD                                           */
/*==============================================================*/
create table AEEST_ESTUD
(
   IDCARRERA            varchar(10) not null,
   AEEST_ID             varchar(10) not null,
   AEEST_CI             varchar(20),
   AEEST_NOMBRE         varchar(50) not null,
   AEEST_APELLIDOS      varchar(50) not null,
   AEEST_PROMEDIO       numeric(3,2) not null,
   AEEST_ESTADO_PAGO    bool not null,
   AEEST_FECHANAC       date not null,
   AEEST_EMAIL          varchar(25) not null,
   AEEST_CELULAR        varchar(10),
   AEEST_DIRECCION      varchar(50) not null,
   IDAEMAT              varchar(10) not null,
   FECHAAEMAT           date not null,
   ESTADOAEMAT          varchar(30) not null,
   primary key (IDCARRERA, AEEST_ID)
);

alter table AEEST_ESTUD comment 'Entidad que almacena la información personal y académica de ';

/*==============================================================*/
/* Table: AEGRU_GRUPO                                           */
/*==============================================================*/
create table AEGRU_GRUPO
(
   IDPERIODO            varchar(10) not null,
   AEASI_ID             varchar(10) not null,
   AEGRU_CODIGO         varchar(20) not null,
   IDCARRERA            varchar(10) not null,
   AEEST_ID             varchar(10) not null,
   PEDOC_ID             varchar(10) not null,
   AEGRU_AULA           varchar(20) not null,
   AEGRU_CUPO_MAX       int not null,
   AEGRU_CUPO_ACTUAL    int not null,
   HORARIOGRUPO         text,
   primary key (IDPERIODO, AEASI_ID, AEGRU_CODIGO)
);

alter table AEGRU_GRUPO comment 'Entidad que representa las secciones o grupos de una asignat';

/*==============================================================*/
/* Table: AEPER_PERIOD                                          */
/*==============================================================*/
create table AEPER_PERIOD
(
   IDPERIODO            varchar(10) not null,
   NOMBREPERIODO        varchar(50) not null,
   FECHA_INICIOPERIODO  date not null,
   FECHA_FINPERIODO     date not null,
   ACTIVOPERIODO        bool not null,
   primary key (IDPERIODO)
);

alter table AEPER_PERIOD comment 'Entidad que representa los periodos académicos (semestres, t';

/*==============================================================*/
/* Table: FEDEU_DEUDA                                           */
/*==============================================================*/
create table FEDEU_DEUDA
(
   FEDEU_ID             int not null,
   IDCARRERA            varchar(10) not null,
   AEEST_ID             varchar(10) not null,
   FEDEU_MONTO_PEND     decimal(10,2) not null,
   FEDEU_FECHA_LIMIT    date not null,
   FEDEU_ESTADO_DEU     varchar(30) not null,
   primary key (FEDEU_ID)
);

alter table FEDEU_DEUDA comment 'Entidad que controla la morosidad o los pagos pendientes.';

/*==============================================================*/
/* Table: FEPAG_PAGO                                            */
/*==============================================================*/
create table FEPAG_PAGO
(
   FEPAG__ID            int not null,
   IDCARRERA            varchar(10) not null,
   AEEST_ID             varchar(10) not null,
   FEPAG_FECHA_PAGO     date not null,
   FEPAG_MONTO_PAGO     decimal(10,2) not null,
   FEPAG_MEDIO          varchar(30) not null,
   FEPAG_ESTADO         varchar(30) not null,
   primary key (FEPAG__ID)
);

alter table FEPAG_PAGO comment 'Entidad que registra los pagos realizados por el estudiante.';

/*==============================================================*/
/* Table: PEASI_ASIGNACION_ROL                                  */
/*==============================================================*/
create table PEASI_ASIGNACION_ROL
(
   PEASI_CODIGO         varchar(10) not null,
   PEROL_CODIGO         varchar(10),
   PEASI_FECHA          date not null,
   PEASI_ESTADO         varchar(20) not null,
   primary key (PEASI_CODIGO)
);

alter table PEASI_ASIGNACION_ROL comment 'Entidad utilizada para representar el rol de asignacion de u';

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
create table PECAR_CARGO
(
   PEDEP_CODIGO         varchar(10) not null,
   PECAR_CODIGO         varchar(10) not null,
   PECAR_NOMBRE         varchar(20) not null,
   PECAR_DESCRI         varchar(20),
   primary key (PEDEP_CODIGO, PECAR_CODIGO)
);

alter table PECAR_CARGO comment 'Entidad utilizada para representar el el CARGO de un DEPARTA';

/*==============================================================*/
/* Table: PEDOC_DOCEN                                           */
/*==============================================================*/
create table PEDOC_DOCEN
(
   PEDOC_ID             varchar(10) not null,
   PEDOC_NOMBRES        varchar(30) not null,
   PEDOC_APELLIDOS      varchar(30) not null,
   PEDOC_EMAIL          varchar(20) not null,
   CEDULADOCENTE        varchar(10),
   primary key (PEDOC_ID)
);

alter table PEDOC_DOCEN comment 'Entidad que contiene los datos personales y de contacto de l';

/*==============================================================*/
/* Table: PEEMP_EMPLE                                           */
/*==============================================================*/
create table PEEMP_EMPLE
(
   PEEMP_CODIGO         varchar(10) not null,
   PESEX_CODIGO         varchar(10) not null,
   PEESC_CODIGO         char(1),
   PEEMP_NOMBRE         varchar(100) not null,
   PEEMP_APELLIDO       varchar(100) not null,
   PEEMP_CORREO         varchar(100) not null,
   PEEMP_CEL            char(10),
   PEEMP_NACIM          date not null,
   PEEMP_CARGAS         numeric(2,0) not null,
   PEEMP_DIRECCION      varchar(100),
   CEDULA               char(10) not null,
   primary key (PEEMP_CODIGO)
);

alter table PEEMP_EMPLE comment 'Entidad que se utiliza para almacenar los empleados';

/*==============================================================*/
/* Table: PEESC_ESTCIV                                          */
/*==============================================================*/
create table PEESC_ESTCIV
(
   PEESC_CODIGO         char(1) not null,
   PEESC_DESCRI         varchar(20) not null,
   primary key (PEESC_CODIGO)
);

alter table PEESC_ESTCIV comment 'Entidad utilizada para representar el estado civil de una pe';

/*==============================================================*/
/* Table: PEROL_INSTITUCIONAL                                   */
/*==============================================================*/
create table PEROL_INSTITUCIONAL
(
   PEROL_CODIGO         varchar(10) not null,
   PEEMP_CODIGO         varchar(10),
   PEROL_NOMBRE         varchar(20) not null,
   PEROL_DESCRIPCION    varchar(100) not null,
   primary key (PEROL_CODIGO)
);

alter table PEROL_INSTITUCIONAL comment 'Entidad utilizada para representar el ROL INSTITUCIONAL de u';

/*==============================================================*/
/* Table: PESEX_SEXO                                            */
/*==============================================================*/
create table PESEX_SEXO
(
   PESEX_CODIGO         varchar(10) not null,
   PESEX_DESCRI         varchar(50) not null,
   primary key (PESEX_CODIGO)
);

alter table PESEX_SEXO comment 'Entidad utilizada para representar el sexo o genero de una p';

/*==============================================================*/
/* Table: XEEST_ESTAD                                           */
/*==============================================================*/
create table XEEST_ESTAD
(
   XEEST_CODIGO         char(1) not null,
   XEEST_DESCRI         varchar(50) not null,
   primary key (XEEST_CODIGO)
);

alter table XEEST_ESTAD comment 'Entidad utilizada para gestionar el estado de las difetrente';

/*==============================================================*/
/* Table: XEOPC_OPCIO                                           */
/*==============================================================*/
create table XEOPC_OPCIO
(
   XEOPC_CODIGO         char(3) not null,
   XESIS_CODIGO         char(1) not null,
   XEOPC_DESCRI         varchar(100) not null,
   primary key (XEOPC_CODIGO)
);

alter table XEOPC_OPCIO comment 'Entidad utilizada para realizar el registro de las diferente';

/*==============================================================*/
/* Table: XEOXP_OPCPE                                           */
/*==============================================================*/
create table XEOXP_OPCPE
(
   XEOPC_CODIGO         char(3) not null,
   XEPER_CODIGO         char(8) not null,
   XEOXP_FECASI         date not null,
   XEOXP_FECRET         date,
   primary key (XEOPC_CODIGO, XEPER_CODIGO, XEOXP_FECASI)
);

alter table XEOXP_OPCPE comment 'Entidad utilizada para llevar el registro de las opciones qu';

/*==============================================================*/
/* Table: XEPER_PERFI                                           */
/*==============================================================*/
create table XEPER_PERFI
(
   XEPER_CODIGO         char(8) not null,
   XEPER_DESCRI         varchar(100) not null,
   XEPER_OBSER          text,
   primary key (XEPER_CODIGO)
);

alter table XEPER_PERFI comment 'Entidad utilizada para realizar la gestión de los diferentes';

/*==============================================================*/
/* Table: XESIS_SISTE                                           */
/*==============================================================*/
create table XESIS_SISTE
(
   XESIS_CODIGO         char(1) not null,
   XESIS_DESCRI         varchar(50) not null,
   primary key (XESIS_CODIGO)
);

alter table XESIS_SISTE comment 'Entidad utilizada para realziar la gestión de los diferentes';

/*==============================================================*/
/* Table: XEUSU_USUAR                                           */
/*==============================================================*/
create table XEUSU_USUAR
(
   PEEMP_CODIGO         varchar(10) not null,
   XEUSU_PASWD          varchar(16) not null,
   XEEST_CODIGO         char(1) not null,
   XEUSU_FECCRE         datetime not null,
   XEUSU_FECMOD         datetime not null,
   XEUSU_PIEFIR         varchar(100) not null,
   primary key (PEEMP_CODIGO, XEUSU_PASWD)
);

alter table XEUSU_USUAR comment 'Entidad relacionada para gentionar los usuario que ingrsan a';

/*==============================================================*/
/* Table: XEUXP_USUPE                                           */
/*==============================================================*/
create table XEUXP_USUPE
(
   PEEMP_CODIGO         varchar(10) not null,
   XEUSU_PASWD          varchar(16) not null,
   XEPER_CODIGO         char(8) not null,
   XEUXP_FECASI         date not null,
   XEUXP_FECRET         date,
   primary key (PEEMP_CODIGO, XEUSU_PASWD, XEPER_CODIGO, XEUXP_FECASI)
);

alter table XEUXP_USUPE comment 'Entidad utilizada para realizar el registro de los diferente';

alter table AEASI_ASIGN add constraint FK_ASIGNATURAREQUISITO foreign key (AEA_AEASI_ID)
      references AEASI_ASIGN (AEASI_ID) on delete restrict on update restrict;

alter table AEEST_ESTUD add constraint FK_AR_AECAR_AEEST foreign key (IDCARRERA)
      references AECAR_CARRER (IDCARRERA) on delete restrict on update restrict;

alter table AEGRU_GRUPO add constraint FK_ARMAT_MATRI foreign key (IDCARRERA, AEEST_ID)
      references AEEST_ESTUD (IDCARRERA, AEEST_ID) on delete restrict on update restrict;

alter table AEGRU_GRUPO add constraint FK_AR_AEASI_AEGRU foreign key (AEASI_ID)
      references AEASI_ASIGN (AEASI_ID) on delete restrict on update restrict;

alter table AEGRU_GRUPO add constraint FK_AR_AEPER_AEGRU foreign key (IDPERIODO)
      references AEPER_PERIOD (IDPERIODO) on delete restrict on update restrict;

alter table AEGRU_GRUPO add constraint FK_AR_PEDOC_AEGRU foreign key (PEDOC_ID)
      references PEDOC_DOCEN (PEDOC_ID) on delete restrict on update restrict;

alter table FEDEU_DEUDA add constraint FK_FR_AEEST_FEDEU foreign key (IDCARRERA, AEEST_ID)
      references AEEST_ESTUD (IDCARRERA, AEEST_ID) on delete restrict on update restrict;

alter table FEPAG_PAGO add constraint FK_FR_AEEST_FEPAG foreign key (IDCARRERA, AEEST_ID)
      references AEEST_ESTUD (IDCARRERA, AEEST_ID) on delete restrict on update restrict;

alter table PEASI_ASIGNACION_ROL add constraint FK_PR_PEAS_PEROL foreign key (PEROL_CODIGO)
      references PEROL_INSTITUCIONAL (PEROL_CODIGO) on delete restrict on update restrict;

alter table PEEMP_EMPLE add constraint FK_PR_PEESC_PEEMP foreign key (PEESC_CODIGO)
      references PEESC_ESTCIV (PEESC_CODIGO) on delete restrict on update restrict;

alter table PEEMP_EMPLE add constraint FK_PR_PESEX_PEEMP foreign key (PESEX_CODIGO)
      references PESEX_SEXO (PESEX_CODIGO) on delete restrict on update restrict;

alter table PEROL_INSTITUCIONAL add constraint FK_PR_PEROL_PEEMP foreign key (PEEMP_CODIGO)
      references PEEMP_EMPLE (PEEMP_CODIGO) on delete restrict on update restrict;

alter table XEOPC_OPCIO add constraint FK_XR_XESIS_XEOPC foreign key (XESIS_CODIGO)
      references XESIS_SISTE (XESIS_CODIGO) on delete restrict on update restrict;

alter table XEOXP_OPCPE add constraint FK_XR_XEOPC_XEOXP foreign key (XEOPC_CODIGO)
      references XEOPC_OPCIO (XEOPC_CODIGO) on delete restrict on update restrict;

alter table XEOXP_OPCPE add constraint FK_XR_XEPER_XEOXP foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO) on delete restrict on update restrict;

alter table XEUSU_USUAR add constraint FK_XR_PEEMP_XEUSU foreign key (PEEMP_CODIGO)
      references PEEMP_EMPLE (PEEMP_CODIGO) on delete restrict on update restrict;

alter table XEUSU_USUAR add constraint FK_XR_XEEST_XEUSU foreign key (XEEST_CODIGO)
      references XEEST_ESTAD (XEEST_CODIGO) on delete restrict on update restrict;

alter table XEUXP_USUPE add constraint FK_XR_XEPER_XEUXP foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO) on delete restrict on update restrict;

alter table XEUXP_USUPE add constraint FK_XR_XEUSU_XEUXP foreign key (PEEMP_CODIGO, XEUSU_PASWD)
      references XEUSU_USUAR (PEEMP_CODIGO, XEUSU_PASWD) on delete restrict on update restrict;

