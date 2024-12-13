CREATE TABLE region (
    codigo_region   NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    nombre          VARCHAR(80) NOT NULL,
    CONSTRAINT REGION_PK PRIMARY KEY (codigo_region)
);

CREATE TABLE comuna (
    codigo_comuna       NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    nombre              VARCHAR(80) NOT NULL,
    codigo_region       NUMBER(15) NOT NULL,
    CONSTRAINT COMUNA_PK PRIMARY KEY(codigo_comuna),
    CONSTRAINT COMUNA_REGION_PK FOREIGN KEY (codigo_region) 
        REFERENCES REGION (codigo_region)
);

CREATE TABLE estado_civil (
    codigo_estado_civil     NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    nombre                  VARCHAR(80) NOT NULL,
    descripcion             VARCHAR(250),
    CONSTRAINT ESTADO_CIVIL_PK PRIMARY KEY(codigo_estado_civil)
);

CREATE TABLE genero (
    codigo_genero       NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    nombre              VARCHAR(80) NOT NULL,
    descripcion         VARCHAR(250),
    CONSTRAINT GENERO_PK PRIMARY KEY(codigo_genero)
);

CREATE TABLE privilegio (
    codigo_privilegio       NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    nombre                  VARCHAR(80) NOT NULL,
    descripcion             VARCHAR(250),
    CONSTRAINT PRIVILEGIO_PK PRIMARY KEY(codigo_privilegio)
);

CREATE TABLE perfil (
    codigo_perfil           NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    nombre                  VARCHAR(80) NOT NULL,
    descripcion             VARCHAR(250),
    CONSTRAINT PERFIL_PK PRIMARY KEY(codigo_perfil)
);

CREATE TABLE privilegio_perfil (
    codigo_perfil           NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    codigo_privilegio       NUMBER(15),
    CONSTRAINT PRIVILEGIO_PERFIL_PK PRIMARY KEY(codigo_privilegio,codigo_perfil),
    CONSTRAINT PRIVILEGIO_PERFIL_PRIVILEGIO_FK FOREIGN KEY (codigo_privilegio) 
        REFERENCES PRIVILEGIO (codigo_privilegio),
    CONSTRAINT PRIVILEGIO_PERFIL_PERFIL_FK FOREIGN KEY (codigo_perfil) 
        REFERENCES PERFIL (codigo_perfil)
);

CREATE TABLE usuario (
    nombre_usuario      VARCHAR(60),
    contrasenia         VARCHAR(64)  NOT NULL,
    pregunta_1          VARCHAR(180),
    pregunta_2          VARCHAR(180),
    codigo_perfil       NUMBER(15) NOT NULL,
    CONSTRAINT USUARIO_PK PRIMARY KEY(nombre_usuario),
    CONSTRAINT USUARIO_PERFIL_FK FOREIGN KEY (codigo_perfil) 
        REFERENCES PERFIL (codigo_perfil)
);

CREATE TABLE persona (
    codigo_persona      NUMBER(15) GENERATED by default on null as IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL,
    run                 VARCHAR(15) NOT NULL,
    nombres             VARCHAR(80) NOT NULL,
    apellido_paterno    VARCHAR(80) NOT NULL,
    apellido_materno    VARCHAR(80) NOT NULL,
    fecha_nacimiento    DATE NOT NULL,
    telefono            VARCHAR(12),
    email_principal     VARCHAR(80) NOT NULL,
    email_secundario    VARCHAR(80),
    nombre_usuario      VARCHAR(60) NOT NULL UNIQUE,
    codigo_estado_civil NUMBER(15) NOT NULL,
    codigo_genero       NUMBER(15) NOT NULL,
    CONSTRAINT PERSONA_PK PRiMARY KEY (codigo_persona),
    CONSTRAINT PERSONA_USUARIO_FK FOREIGN KEY (nombre_usuario) 
        REFERENCES USUARIO (nombre_usuario),
    CONSTRAINT PERSONA_ESTADO_CIVIL_FK FOREIGN KEY (codigo_estado_civil) 
        REFERENCES ESTADO_CIVIL (codigo_estado_civil),
    CONSTRAINT PERSONA_GENERO_FK FOREIGN KEY (codigo_genero) 
        REFERENCES GENERO (codigo_genero)
);

CREATE TABLE direccion (
    codigo_direccion    NUMBER(15),
    calle               VARCHAR(180) NOT NULL,
    numero              VARCHAR(50) NOT NULL,
    departamento        VARCHAR(10),
    block               VARCHAR(10),
    codigo_persona      NUMBER(15) NOT NULL,
    codigo_comuna       NUMBER(15) NOT NULL,
    CONSTRAINT DIRECCION_PK PRIMARY KEY (codigo_direccion),
    CONSTRAINT DIRECCION_PERSONA_FK FOREIGN KEY (codigo_persona) 
        REFERENCES PERSONA (codigo_persona),
    CONSTRAINT  DIRECCION_COMUNA_FK FOREIGN KEY (codigo_comuna) 
        REFERENCES COMUNA (codigo_comuna)
);

/*
    DROP TABLE DIRECCION;
    DROP TABLE PERSONA;
    DROP TABLE USUARIO;
    DROP TABLE PRIVILEGIO_PERFIL;
    DROP TABLE COMUNA;
    DROP TABLE REGION;
    DROP TABLE ESTADO_CIVIL;
    DROP TABLE GENERO;
    DROP TABLE PRIVILEGIO;
    DROP TABLE PERFIL;
*/
    