/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     19/11/2025 07:47:56                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AEASI_ASIGN') and o.name = 'FK_AEASI_AS_ASIGNATUR_AEASI_AS')
alter table AEASI_ASIGN
   drop constraint FK_AEASI_AS_ASIGNATUR_AEASI_AS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AEEST_ESTUD') and o.name = 'FK_AEEST_ES_AR_AECAR__AECAR_CA')
alter table AEEST_ESTUD
   drop constraint FK_AEEST_ES_AR_AECAR__AECAR_CA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AEGRU_GRUPO') and o.name = 'FK_AEGRU_GR_ARMAT_MAT_AEEST_ES')
alter table AEGRU_GRUPO
   drop constraint FK_AEGRU_GR_ARMAT_MAT_AEEST_ES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AEGRU_GRUPO') and o.name = 'FK_AEGRU_GR_AR_AEASI__AEASI_AS')
alter table AEGRU_GRUPO
   drop constraint FK_AEGRU_GR_AR_AEASI__AEASI_AS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AEGRU_GRUPO') and o.name = 'FK_AEGRU_GR_AR_AEPER__AEPER_PE')
alter table AEGRU_GRUPO
   drop constraint FK_AEGRU_GR_AR_AEPER__AEPER_PE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AEGRU_GRUPO') and o.name = 'FK_AEGRU_GR_AR_PEDOC__PEDOC_DO')
alter table AEGRU_GRUPO
   drop constraint FK_AEGRU_GR_AR_PEDOC__PEDOC_DO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FEDEU_DEUDA') and o.name = 'FK_FEDEU_DE_FR_AEEST__AEEST_ES')
alter table FEDEU_DEUDA
   drop constraint FK_FEDEU_DE_FR_AEEST__AEEST_ES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FEPAG_PAGO') and o.name = 'FK_FEPAG_PA_FR_AEEST__AEEST_ES')
alter table FEPAG_PAGO
   drop constraint FK_FEPAG_PA_FR_AEEST__AEEST_ES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PEASI_ASIGNACION_ROL') and o.name = 'FK_PEASI_AS_PR_PEAS_P_PEROL_IN')
alter table PEASI_ASIGNACION_ROL
   drop constraint FK_PEASI_AS_PR_PEAS_P_PEROL_IN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PEEMP_EMPLE') and o.name = 'FK_PEEMP_EM_PR_PEESC__PEESC_ES')
alter table PEEMP_EMPLE
   drop constraint FK_PEEMP_EM_PR_PEESC__PEESC_ES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PEEMP_EMPLE') and o.name = 'FK_PEEMP_EM_PR_PESEX__PESEX_SE')
alter table PEEMP_EMPLE
   drop constraint FK_PEEMP_EM_PR_PESEX__PESEX_SE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PEROL_INSTITUCIONAL') and o.name = 'FK_PEROL_IN_PR_PEROL__PEEMP_EM')
alter table PEROL_INSTITUCIONAL
   drop constraint FK_PEROL_IN_PR_PEROL__PEEMP_EM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEOPC_OPCIO') and o.name = 'FK_XEOPC_OP_XR_XESIS__XESIS_SI')
alter table XEOPC_OPCIO
   drop constraint FK_XEOPC_OP_XR_XESIS__XESIS_SI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEOXP_OPCPE') and o.name = 'FK_XEOXP_OP_XR_XEOPC__XEOPC_OP')
alter table XEOXP_OPCPE
   drop constraint FK_XEOXP_OP_XR_XEOPC__XEOPC_OP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEOXP_OPCPE') and o.name = 'FK_XEOXP_OP_XR_XEPER__XEPER_PE')
alter table XEOXP_OPCPE
   drop constraint FK_XEOXP_OP_XR_XEPER__XEPER_PE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUSU_USUAR') and o.name = 'FK_XEUSU_US_XR_PEEMP__PEEMP_EM')
alter table XEUSU_USUAR
   drop constraint FK_XEUSU_US_XR_PEEMP__PEEMP_EM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUSU_USUAR') and o.name = 'FK_XEUSU_US_XR_XEEST__XEEST_ES')
alter table XEUSU_USUAR
   drop constraint FK_XEUSU_US_XR_XEEST__XEEST_ES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUXP_USUPE') and o.name = 'FK_XEUXP_US_XR_XEPER__XEPER_PE')
alter table XEUXP_USUPE
   drop constraint FK_XEUXP_US_XR_XEPER__XEPER_PE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUXP_USUPE') and o.name = 'FK_XEUXP_US_XR_XEUSU__XEUSU_US')
alter table XEUXP_USUPE
   drop constraint FK_XEUXP_US_XR_XEUSU__XEUSU_US
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AEASI_ASIGN')
            and   name  = 'ASIGNATURAOBJETIVO_FK'
            and   indid > 0
            and   indid < 255)
   drop index AEASI_ASIGN.ASIGNATURAOBJETIVO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AEASI_ASIGN')
            and   type = 'U')
   drop table AEASI_ASIGN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AECAR_CARRER')
            and   type = 'U')
   drop table AECAR_CARRER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AEEST_ESTUD')
            and   name  = 'AR_AECAR_AEEST_FK'
            and   indid > 0
            and   indid < 255)
   drop index AEEST_ESTUD.AR_AECAR_AEEST_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AEEST_ESTUD')
            and   type = 'U')
   drop table AEEST_ESTUD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AEGRU_GRUPO')
            and   name  = 'AR_PEDOC_AEGRU_FK'
            and   indid > 0
            and   indid < 255)
   drop index AEGRU_GRUPO.AR_PEDOC_AEGRU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AEGRU_GRUPO')
            and   name  = 'AR_AEPER_AEGRU_FK'
            and   indid > 0
            and   indid < 255)
   drop index AEGRU_GRUPO.AR_AEPER_AEGRU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AEGRU_GRUPO')
            and   name  = 'AR_AEASI_AEGRU_FK'
            and   indid > 0
            and   indid < 255)
   drop index AEGRU_GRUPO.AR_AEASI_AEGRU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AEGRU_GRUPO')
            and   name  = 'ARMAT_MATRI_FK'
            and   indid > 0
            and   indid < 255)
   drop index AEGRU_GRUPO.ARMAT_MATRI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AEGRU_GRUPO')
            and   type = 'U')
   drop table AEGRU_GRUPO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AEPER_PERIOD')
            and   type = 'U')
   drop table AEPER_PERIOD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FEDEU_DEUDA')
            and   name  = 'FR_AEEST_FEDEU_FK'
            and   indid > 0
            and   indid < 255)
   drop index FEDEU_DEUDA.FR_AEEST_FEDEU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FEDEU_DEUDA')
            and   type = 'U')
   drop table FEDEU_DEUDA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FEPAG_PAGO')
            and   name  = 'FR_AEEST_FEPAG_FK'
            and   indid > 0
            and   indid < 255)
   drop index FEPAG_PAGO.FR_AEEST_FEPAG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FEPAG_PAGO')
            and   type = 'U')
   drop table FEPAG_PAGO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PEASI_ASIGNACION_ROL')
            and   name  = 'PR_PEAS_PEROL_FK'
            and   indid > 0
            and   indid < 255)
   drop index PEASI_ASIGNACION_ROL.PR_PEAS_PEROL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEASI_ASIGNACION_ROL')
            and   type = 'U')
   drop table PEASI_ASIGNACION_ROL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PECAR_CARGO')
            and   type = 'U')
   drop table PECAR_CARGO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEDOC_DOCEN')
            and   type = 'U')
   drop table PEDOC_DOCEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PEEMP_EMPLE')
            and   name  = 'PR_PEESC_PEEMP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PEEMP_EMPLE.PR_PEESC_PEEMP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PEEMP_EMPLE')
            and   name  = 'PR_PESEX_PEEMP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PEEMP_EMPLE.PR_PESEX_PEEMP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEEMP_EMPLE')
            and   type = 'U')
   drop table PEEMP_EMPLE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEESC_ESTCIV')
            and   type = 'U')
   drop table PEESC_ESTCIV
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PEROL_INSTITUCIONAL')
            and   name  = 'PR_PEROL_PEEMP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PEROL_INSTITUCIONAL.PR_PEROL_PEEMP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEROL_INSTITUCIONAL')
            and   type = 'U')
   drop table PEROL_INSTITUCIONAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PESEX_SEXO')
            and   type = 'U')
   drop table PESEX_SEXO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEEST_ESTAD')
            and   type = 'U')
   drop table XEEST_ESTAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEOPC_OPCIO')
            and   name  = 'XR_XESIS_XEOPC_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEOPC_OPCIO.XR_XESIS_XEOPC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEOPC_OPCIO')
            and   type = 'U')
   drop table XEOPC_OPCIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEOXP_OPCPE')
            and   name  = 'XR_XEOPC_XEOXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEOXP_OPCPE.XR_XEOPC_XEOXP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEOXP_OPCPE')
            and   name  = 'XR_XEPER_XEOXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEOXP_OPCPE.XR_XEPER_XEOXP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEOXP_OPCPE')
            and   type = 'U')
   drop table XEOXP_OPCPE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEPER_PERFI')
            and   type = 'U')
   drop table XEPER_PERFI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XESIS_SISTE')
            and   type = 'U')
   drop table XESIS_SISTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUSU_USUAR')
            and   name  = 'XR_PEEMP_XEUSU_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUSU_USUAR.XR_PEEMP_XEUSU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUSU_USUAR')
            and   name  = 'XR_XEEST_XEUSU_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUSU_USUAR.XR_XEEST_XEUSU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEUSU_USUAR')
            and   type = 'U')
   drop table XEUSU_USUAR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUXP_USUPE')
            and   name  = 'XR_XEUSU_XEUXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUXP_USUPE.XR_XEUSU_XEUXP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUXP_USUPE')
            and   name  = 'XR_XEPER_XEUXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUXP_USUPE.XR_XEPER_XEUXP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEUXP_USUPE')
            and   type = 'U')
   drop table XEUXP_USUPE
go

/*==============================================================*/
/* Table: AEASI_ASIGN                                           */
/*==============================================================*/
create table AEASI_ASIGN (
   AEASI_ID             varchar(10)          not null,
   AEA_AEASI_ID         varchar(10)          null,
   AEASI_CODIGO         varchar(10)          null,
   AEASI_NOMBRE         varchar(20)          null,
   AEASI_CREDITOS       int                  null,
   DESCRIPCIONASIGNATURA varchar(100)         null,
   ARASRTIPO            varchar(10)          null,
   constraint PK_AEASI_ASIGN primary key (AEASI_ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AEASI_ASIGN') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AEASI_ASIGN' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que se utiliza para almacenar las asignaturas.', 
   'user', @CurrentUser, 'table', 'AEASI_ASIGN'
go

/*==============================================================*/
/* Index: ASIGNATURAOBJETIVO_FK                                 */
/*==============================================================*/




create nonclustered index ASIGNATURAOBJETIVO_FK on AEASI_ASIGN (AEA_AEASI_ID ASC)
go

/*==============================================================*/
/* Table: AECAR_CARRER                                          */
/*==============================================================*/
create table AECAR_CARRER (
   IDCARRERA            varchar(10)          not null,
   NOMBRECARRERA        varchar(20)          not null,
   CODIGOCARRERA        varchar(10)          not null,
   MAX_CREDITOSCARRERA  numeric(24)          not null,
   MIN_CREDITOSCARRERA  numeric(12)          not null,
   constraint PK_AECAR_CARRER primary key (IDCARRERA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AECAR_CARRER') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AECAR_CARRER' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que representa las carreras o programas académicos. Incluye límites de créditos permitidos por periodo y sus parámetros de matrícula.', 
   'user', @CurrentUser, 'table', 'AECAR_CARRER'
go

/*==============================================================*/
/* Table: AEEST_ESTUD                                           */
/*==============================================================*/
create table AEEST_ESTUD (
   IDCARRERA            varchar(10)          not null,
   AEEST_ID             varchar(10)          not null,
   AEEST_CI             varchar(20)          null,
   AEEST_NOMBRE         varchar(50)          not null,
   AEEST_APELLIDOS      varchar(50)          not null,
   AEEST_PROMEDIO       numeric(3,2)         not null,
   AEEST_ESTADO_PAGO    bit                  not null,
   AEEST_FECHANAC       datetime             not null,
   AEEST_EMAIL          varchar(25)          not null,
   AEEST_CELULAR        varchar(10)          null,
   AEEST_DIRECCION      varchar(50)          not null,
   constraint PK_AEEST_ESTUD primary key (IDCARRERA, AEEST_ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AEEST_ESTUD') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AEEST_ESTUD' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que almacena la información personal y académica de los estudiantes matriculados, incluyendo identificación, contacto, promedio y estado de pago.', 
   'user', @CurrentUser, 'table', 'AEEST_ESTUD'
go

/*==============================================================*/
/* Index: AR_AECAR_AEEST_FK                                     */
/*==============================================================*/




create nonclustered index AR_AECAR_AEEST_FK on AEEST_ESTUD (IDCARRERA ASC)
go

/*==============================================================*/
/* Table: AEGRU_GRUPO                                           */
/*==============================================================*/
create table AEGRU_GRUPO (
   AEASI_ID             varchar(10)          not null,
   IDPERIODO            varchar(10)          not null,
   AEGRU_CODIGO         varchar(20)          not null,
   PEDOC_ID             varchar(10)          not null,
   IDCARRERA            varchar(10)          not null,
   AEEST_ID             varchar(10)          not null,
   AEGRU_AULA           varchar(20)          not null,
   AEGRU_CUPO_MAX       int                  not null,
   AEGRU_CUPO_ACTUAL    int                  not null,
   HORARIOGRUPO         text                 null,
   IDAEMAT              varchar(10)          not null,
   FECHAAEMAT           datetime             not null,
   ESTADOAEMAT          varchar(30)          not null,
   constraint PK_AEGRU_GRUPO primary key (AEASI_ID, IDPERIODO, AEGRU_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AEGRU_GRUPO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AEGRU_GRUPO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que representa las secciones o grupos de una asignatura en un periodo determinado, con información de aula, docente, horario y cupos disponibles.', 
   'user', @CurrentUser, 'table', 'AEGRU_GRUPO'
go

/*==============================================================*/
/* Index: ARMAT_MATRI_FK                                        */
/*==============================================================*/




create nonclustered index ARMAT_MATRI_FK on AEGRU_GRUPO (IDCARRERA ASC,
  AEEST_ID ASC)
go

/*==============================================================*/
/* Index: AR_AEASI_AEGRU_FK                                     */
/*==============================================================*/




create nonclustered index AR_AEASI_AEGRU_FK on AEGRU_GRUPO (AEASI_ID ASC)
go

/*==============================================================*/
/* Index: AR_AEPER_AEGRU_FK                                     */
/*==============================================================*/




create nonclustered index AR_AEPER_AEGRU_FK on AEGRU_GRUPO (IDPERIODO ASC)
go

/*==============================================================*/
/* Index: AR_PEDOC_AEGRU_FK                                     */
/*==============================================================*/




create nonclustered index AR_PEDOC_AEGRU_FK on AEGRU_GRUPO (PEDOC_ID ASC)
go

/*==============================================================*/
/* Table: AEPER_PERIOD                                          */
/*==============================================================*/
create table AEPER_PERIOD (
   IDPERIODO            varchar(10)          not null,
   NOMBREPERIODO        varchar(50)          not null,
   FECHA_INICIOPERIODO  datetime             not null,
   FECHA_FINPERIODO     datetime             not null,
   ACTIVOPERIODO        bit                  not null,
   constraint PK_AEPER_PERIOD primary key (IDPERIODO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AEPER_PERIOD') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AEPER_PERIOD' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que representa los periodos académicos (semestres, trimestres o años lectivos). Se utiliza para controlar la apertura y cierre de matrículas y grupos.', 
   'user', @CurrentUser, 'table', 'AEPER_PERIOD'
go

/*==============================================================*/
/* Table: FEDEU_DEUDA                                           */
/*==============================================================*/
create table FEDEU_DEUDA (
   FEDEU_ID             int                  not null,
   IDCARRERA            varchar(10)          not null,
   AEEST_ID             varchar(10)          not null,
   FEDEU_MONTO_PEND     decimal(10,2)        not null,
   FEDEU_FECHA_LIMIT    datetime             not null,
   FEDEU_ESTADO_DEU     varchar(30)          not null,
   constraint PK_FEDEU_DEUDA primary key (FEDEU_ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FEDEU_DEUDA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FEDEU_DEUDA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que controla la morosidad o los pagos pendientes.', 
   'user', @CurrentUser, 'table', 'FEDEU_DEUDA'
go

/*==============================================================*/
/* Index: FR_AEEST_FEDEU_FK                                     */
/*==============================================================*/




create nonclustered index FR_AEEST_FEDEU_FK on FEDEU_DEUDA (IDCARRERA ASC,
  AEEST_ID ASC)
go

/*==============================================================*/
/* Table: FEPAG_PAGO                                            */
/*==============================================================*/
create table FEPAG_PAGO (
   FEPAG__ID            int                  not null,
   IDCARRERA            varchar(10)          not null,
   AEEST_ID             varchar(10)          not null,
   FEPAG_FECHA_PAGO     datetime             not null,
   FEPAG_MONTO_PAGO     decimal(10,2)        not null,
   FEPAG_MEDIO          varchar(30)          not null,
   FEPAG_ESTADO         varchar(30)          not null,
   constraint PK_FEPAG_PAGO primary key (FEPAG__ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FEPAG_PAGO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FEPAG_PAGO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que registra los pagos realizados por el estudiante.', 
   'user', @CurrentUser, 'table', 'FEPAG_PAGO'
go

/*==============================================================*/
/* Index: FR_AEEST_FEPAG_FK                                     */
/*==============================================================*/




create nonclustered index FR_AEEST_FEPAG_FK on FEPAG_PAGO (IDCARRERA ASC,
  AEEST_ID ASC)
go

/*==============================================================*/
/* Table: PEASI_ASIGNACION_ROL                                  */
/*==============================================================*/
create table PEASI_ASIGNACION_ROL (
   PEASI_CODIGO         varchar(10)          not null,
   PEROL_CODIGO         varchar(10)          null,
   PEASI_FECHA          datetime             not null,
   PEASI_ESTADO         varchar(20)          not null,
   constraint PK_PEASI_ASIGNACION_ROL primary key (PEASI_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEASI_ASIGNACION_ROL') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEASI_ASIGNACION_ROL' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el rol de asignacion de una persona', 
   'user', @CurrentUser, 'table', 'PEASI_ASIGNACION_ROL'
go

/*==============================================================*/
/* Index: PR_PEAS_PEROL_FK                                      */
/*==============================================================*/




create nonclustered index PR_PEAS_PEROL_FK on PEASI_ASIGNACION_ROL (PEROL_CODIGO ASC)
go

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
create table PECAR_CARGO (
   PEDEP_CODIGO         varchar(10)          not null,
   PECAR_CODIGO         varchar(10)          not null,
   PECAR_NOMBRE         varchar(20)          not null,
   PECAR_DESCRI         varchar(20)          null,
   constraint PK_PECAR_CARGO primary key (PEDEP_CODIGO, PECAR_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PECAR_CARGO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PECAR_CARGO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el el CARGO de un DEPARTAMENTO', 
   'user', @CurrentUser, 'table', 'PECAR_CARGO'
go

/*==============================================================*/
/* Table: PEDOC_DOCEN                                           */
/*==============================================================*/
create table PEDOC_DOCEN (
   PEDOC_ID             varchar(10)          not null,
   PEDOC_NOMBRES        varchar(30)          not null,
   PEDOC_APELLIDOS      varchar(30)          not null,
   PEDOC_EMAIL          varchar(20)          not null,
   CEDULADOCENTE        varchar(10)          null,
   constraint PK_PEDOC_DOCEN primary key (PEDOC_ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEDOC_DOCEN') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEDOC_DOCEN' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que contiene los datos personales y de contacto de los docentes. Se asocia con los grupos que imparten durante cada periodo.', 
   'user', @CurrentUser, 'table', 'PEDOC_DOCEN'
go

/*==============================================================*/
/* Table: PEEMP_EMPLE                                           */
/*==============================================================*/
create table PEEMP_EMPLE (
   PEEMP_CODIGO         varchar(10)          not null,
   PEDEP_CODIGO         varchar(10)          null,
   PEESC_CODIGO         char(1)              null,
   PESEX_CODIGO         varchar(10)          not null,
   PEEMP_NOMBRE         varchar(100)         not null,
   PEEMP_APELLIDO       varchar(100)         not null,
   PEEMP_CORREO         varchar(100)         not null,
   PEEMP_CEL            char(10)             null,
   PEEMP_NACIM          datetime             not null,
   PEEMP_CARGAS         numeric(2,0)         not null,
   PEEMP_DIRECCION      varchar(100)         null,
   CEDULA               char(10)             not null,
   constraint PK_PEEMP_EMPLE primary key (PEEMP_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEEMP_EMPLE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEEMP_EMPLE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad que se utiliza para almacenar los empleados', 
   'user', @CurrentUser, 'table', 'PEEMP_EMPLE'
go

/*==============================================================*/
/* Index: PR_PESEX_PEEMP_FK                                     */
/*==============================================================*/




create nonclustered index PR_PESEX_PEEMP_FK on PEEMP_EMPLE (PESEX_CODIGO ASC)
go

/*==============================================================*/
/* Index: PR_PEESC_PEEMP_FK                                     */
/*==============================================================*/




create nonclustered index PR_PEESC_PEEMP_FK on PEEMP_EMPLE (PEESC_CODIGO ASC)
go

/*==============================================================*/
/* Table: PEESC_ESTCIV                                          */
/*==============================================================*/
create table PEESC_ESTCIV (
   PEESC_CODIGO         char(1)              not null,
   PEESC_DESCRI         varchar(20)          not null,
   constraint PK_PEESC_ESTCIV primary key (PEESC_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEESC_ESTCIV') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEESC_ESTCIV' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el estado civil de una persona', 
   'user', @CurrentUser, 'table', 'PEESC_ESTCIV'
go

/*==============================================================*/
/* Table: PEROL_INSTITUCIONAL                                   */
/*==============================================================*/
create table PEROL_INSTITUCIONAL (
   PEROL_CODIGO         varchar(10)          not null,
   PEEMP_CODIGO         varchar(10)          null,
   PEROL_NOMBRE         varchar(20)          not null,
   PEROL_DESCRIPCION    varchar(100)         not null,
   constraint PK_PEROL_INSTITUCIONAL primary key (PEROL_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEROL_INSTITUCIONAL') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEROL_INSTITUCIONAL' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el ROL INSTITUCIONAL de una persona', 
   'user', @CurrentUser, 'table', 'PEROL_INSTITUCIONAL'
go

/*==============================================================*/
/* Index: PR_PEROL_PEEMP_FK                                     */
/*==============================================================*/




create nonclustered index PR_PEROL_PEEMP_FK on PEROL_INSTITUCIONAL (PEEMP_CODIGO ASC)
go

/*==============================================================*/
/* Table: PESEX_SEXO                                            */
/*==============================================================*/
create table PESEX_SEXO (
   PESEX_CODIGO         varchar(10)          not null,
   PESEX_DESCRI         varchar(50)          not null,
   constraint PK_PESEX_SEXO primary key (PESEX_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PESEX_SEXO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PESEX_SEXO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el sexo o genero de una persona', 
   'user', @CurrentUser, 'table', 'PESEX_SEXO'
go

/*==============================================================*/
/* Table: XEEST_ESTAD                                           */
/*==============================================================*/
create table XEEST_ESTAD (
   XEEST_CODIGO         char(1)              not null,
   XEEST_DESCRI         varchar(50)          not null,
   constraint PK_XEEST_ESTAD primary key (XEEST_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEEST_ESTAD') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEEST_ESTAD' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para gestionar el estado de las difetrentes tablas', 
   'user', @CurrentUser, 'table', 'XEEST_ESTAD'
go

/*==============================================================*/
/* Table: XEOPC_OPCIO                                           */
/*==============================================================*/
create table XEOPC_OPCIO (
   XEOPC_CODIGO         char(3)              not null,
   XESIS_CODIGO         char(1)              not null,
   XEOPC_DESCRI         varchar(100)         not null,
   constraint PK_XEOPC_OPCIO primary key (XEOPC_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEOPC_OPCIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEOPC_OPCIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar el registro de las diferentes opciones de un sistema', 
   'user', @CurrentUser, 'table', 'XEOPC_OPCIO'
go

/*==============================================================*/
/* Index: XR_XESIS_XEOPC_FK                                     */
/*==============================================================*/




create nonclustered index XR_XESIS_XEOPC_FK on XEOPC_OPCIO (XESIS_CODIGO ASC)
go

/*==============================================================*/
/* Table: XEOXP_OPCPE                                           */
/*==============================================================*/
create table XEOXP_OPCPE (
   XEPER_CODIGO         char(8)              not null,
   XEOPC_CODIGO         char(3)              not null,
   XEOXP_FECASI         datetime             not null,
   XEOXP_FECRET         datetime             null,
   constraint PK_XEOXP_OPCPE primary key (XEPER_CODIGO, XEOPC_CODIGO, XEOXP_FECASI)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEOXP_OPCPE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEOXP_OPCPE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para llevar el registro de las opciones que pertenecen a un perfil', 
   'user', @CurrentUser, 'table', 'XEOXP_OPCPE'
go

/*==============================================================*/
/* Index: XR_XEPER_XEOXP_FK                                     */
/*==============================================================*/




create nonclustered index XR_XEPER_XEOXP_FK on XEOXP_OPCPE (XEPER_CODIGO ASC)
go

/*==============================================================*/
/* Index: XR_XEOPC_XEOXP_FK                                     */
/*==============================================================*/




create nonclustered index XR_XEOPC_XEOXP_FK on XEOXP_OPCPE (XEOPC_CODIGO ASC)
go

/*==============================================================*/
/* Table: XEPER_PERFI                                           */
/*==============================================================*/
create table XEPER_PERFI (
   XEPER_CODIGO         char(8)              not null,
   XEPER_DESCRI         varchar(100)         not null,
   XEPER_OBSER          text                 null,
   constraint PK_XEPER_PERFI primary key (XEPER_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEPER_PERFI') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEPER_PERFI' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar la gestión de los diferentes perfiles', 
   'user', @CurrentUser, 'table', 'XEPER_PERFI'
go

/*==============================================================*/
/* Table: XESIS_SISTE                                           */
/*==============================================================*/
create table XESIS_SISTE (
   XESIS_CODIGO         char(1)              not null,
   XESIS_DESCRI         varchar(50)          not null,
   constraint PK_XESIS_SISTE primary key (XESIS_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XESIS_SISTE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XESIS_SISTE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realziar la gestión de los diferentes subsistemas', 
   'user', @CurrentUser, 'table', 'XESIS_SISTE'
go

/*==============================================================*/
/* Table: XEUSU_USUAR                                           */
/*==============================================================*/
create table XEUSU_USUAR (
   PEEMP_CODIGO         varchar(10)          not null,
   XEUSU_PASWD          varchar(16)          not null,
   XEEST_CODIGO         char(1)              not null,
   XEUSU_FECCRE         datetime             not null,
   XEUSU_FECMOD         datetime             not null,
   XEUSU_PIEFIR         varchar(100)         not null,
   constraint PK_XEUSU_USUAR primary key (PEEMP_CODIGO, XEUSU_PASWD)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEUSU_USUAR') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEUSU_USUAR' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad relacionada para gentionar los usuario que ingrsan al sistema', 
   'user', @CurrentUser, 'table', 'XEUSU_USUAR'
go

/*==============================================================*/
/* Index: XR_XEEST_XEUSU_FK                                     */
/*==============================================================*/




create nonclustered index XR_XEEST_XEUSU_FK on XEUSU_USUAR (XEEST_CODIGO ASC)
go

/*==============================================================*/
/* Index: XR_PEEMP_XEUSU_FK                                     */
/*==============================================================*/




create nonclustered index XR_PEEMP_XEUSU_FK on XEUSU_USUAR (PEEMP_CODIGO ASC)
go

/*==============================================================*/
/* Table: XEUXP_USUPE                                           */
/*==============================================================*/
create table XEUXP_USUPE (
   XEPER_CODIGO         char(8)              not null,
   PEEMP_CODIGO         varchar(10)          not null,
   XEUSU_PASWD          varchar(16)          not null,
   XEUXP_FECASI         datetime             not null,
   XEUXP_FECRET         datetime             null,
   constraint PK_XEUXP_USUPE primary key (XEPER_CODIGO, PEEMP_CODIGO, XEUSU_PASWD, XEUXP_FECASI)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEUXP_USUPE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEUXP_USUPE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar el registro de los diferentes usuarios que pertenecen a un perfil', 
   'user', @CurrentUser, 'table', 'XEUXP_USUPE'
go

/*==============================================================*/
/* Index: XR_XEPER_XEUXP_FK                                     */
/*==============================================================*/




create nonclustered index XR_XEPER_XEUXP_FK on XEUXP_USUPE (XEPER_CODIGO ASC)
go

/*==============================================================*/
/* Index: XR_XEUSU_XEUXP_FK                                     */
/*==============================================================*/




create nonclustered index XR_XEUSU_XEUXP_FK on XEUXP_USUPE (PEEMP_CODIGO ASC,
  XEUSU_PASWD ASC)
go

alter table AEASI_ASIGN
   add constraint FK_AEASI_AS_ASIGNATUR_AEASI_AS foreign key (AEA_AEASI_ID)
      references AEASI_ASIGN (AEASI_ID)
go

alter table AEEST_ESTUD
   add constraint FK_AEEST_ES_AR_AECAR__AECAR_CA foreign key (IDCARRERA)
      references AECAR_CARRER (IDCARRERA)
go

alter table AEGRU_GRUPO
   add constraint FK_AEGRU_GR_ARMAT_MAT_AEEST_ES foreign key (IDCARRERA, AEEST_ID)
      references AEEST_ESTUD (IDCARRERA, AEEST_ID)
go

alter table AEGRU_GRUPO
   add constraint FK_AEGRU_GR_AR_AEASI__AEASI_AS foreign key (AEASI_ID)
      references AEASI_ASIGN (AEASI_ID)
go

alter table AEGRU_GRUPO
   add constraint FK_AEGRU_GR_AR_AEPER__AEPER_PE foreign key (IDPERIODO)
      references AEPER_PERIOD (IDPERIODO)
go

alter table AEGRU_GRUPO
   add constraint FK_AEGRU_GR_AR_PEDOC__PEDOC_DO foreign key (PEDOC_ID)
      references PEDOC_DOCEN (PEDOC_ID)
go

alter table FEDEU_DEUDA
   add constraint FK_FEDEU_DE_FR_AEEST__AEEST_ES foreign key (IDCARRERA, AEEST_ID)
      references AEEST_ESTUD (IDCARRERA, AEEST_ID)
go

alter table FEPAG_PAGO
   add constraint FK_FEPAG_PA_FR_AEEST__AEEST_ES foreign key (IDCARRERA, AEEST_ID)
      references AEEST_ESTUD (IDCARRERA, AEEST_ID)
go

alter table PEASI_ASIGNACION_ROL
   add constraint FK_PEASI_AS_PR_PEAS_P_PEROL_IN foreign key (PEROL_CODIGO)
      references PEROL_INSTITUCIONAL (PEROL_CODIGO)
go

alter table PEEMP_EMPLE
   add constraint FK_PEEMP_EM_PR_PEESC__PEESC_ES foreign key (PEESC_CODIGO)
      references PEESC_ESTCIV (PEESC_CODIGO)
go

alter table PEEMP_EMPLE
   add constraint FK_PEEMP_EM_PR_PESEX__PESEX_SE foreign key (PESEX_CODIGO)
      references PESEX_SEXO (PESEX_CODIGO)
go

alter table PEROL_INSTITUCIONAL
   add constraint FK_PEROL_IN_PR_PEROL__PEEMP_EM foreign key (PEEMP_CODIGO)
      references PEEMP_EMPLE (PEEMP_CODIGO)
go

alter table XEOPC_OPCIO
   add constraint FK_XEOPC_OP_XR_XESIS__XESIS_SI foreign key (XESIS_CODIGO)
      references XESIS_SISTE (XESIS_CODIGO)
go

alter table XEOXP_OPCPE
   add constraint FK_XEOXP_OP_XR_XEOPC__XEOPC_OP foreign key (XEOPC_CODIGO)
      references XEOPC_OPCIO (XEOPC_CODIGO)
go

alter table XEOXP_OPCPE
   add constraint FK_XEOXP_OP_XR_XEPER__XEPER_PE foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO)
go

alter table XEUSU_USUAR
   add constraint FK_XEUSU_US_XR_PEEMP__PEEMP_EM foreign key (PEEMP_CODIGO)
      references PEEMP_EMPLE (PEEMP_CODIGO)
go

alter table XEUSU_USUAR
   add constraint FK_XEUSU_US_XR_XEEST__XEEST_ES foreign key (XEEST_CODIGO)
      references XEEST_ESTAD (XEEST_CODIGO)
go

alter table XEUXP_USUPE
   add constraint FK_XEUXP_US_XR_XEPER__XEPER_PE foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO)
go

alter table XEUXP_USUPE
   add constraint FK_XEUXP_US_XR_XEUSU__XEUSU_US foreign key (PEEMP_CODIGO, XEUSU_PASWD)
      references XEUSU_USUAR (PEEMP_CODIGO, XEUSU_PASWD)
go

