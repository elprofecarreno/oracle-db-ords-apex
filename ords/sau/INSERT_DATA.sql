INSERT INTO genero (nombre) VALUES ('Masculino');
INSERT INTO genero (nombre) VALUES ('Femenino');
COMMIT;

INSERT INTO estado_civil (nombre) VALUES ('SOLTERO');
INSERT INTO estado_civil (nombre) VALUES ('CASADO');
COMMIT;

INSERT INTO region (nombre) VALUES ('REGIÓN METROPOLITANA');
INSERT INTO region (nombre) VALUES ('ARICA Y PARINACOTA');
INSERT INTO region (nombre) VALUES ('REGION DE LOS LAGOS');
COMMIT;

INSERT INTO comuna (nombre, codigo_region) VALUES ('MAIPU', 1);
INSERT INTO comuna (nombre, codigo_region) VALUES ('SANTIAGO', 1);
INSERT INTO comuna (nombre, codigo_region) VALUES ('ÑUÑOA', 1);
INSERT INTO comuna (nombre, codigo_region) VALUES ('PROVIDENCIA', 1);
INSERT INTO comuna (nombre, codigo_region) VALUES ('PUDAHUEL', 1);
INSERT INTO comuna (nombre, codigo_region) VALUES ('PUTRE', 2);
INSERT INTO comuna (nombre, codigo_region) VALUES ('ANCUD', 3);
INSERT INTO comuna (nombre, codigo_region) VALUES ('CASTRO', 3);
INSERT INTO comuna (nombre, codigo_region) VALUES ('DALCACHUE', 3);

COMMIT;

INSERT INTO privilegio (nombre, descripcion) VALUES ('create_comuna', 'PERMISO DE INSERCIÓN SOBRE LA TABLA comuna');
INSERT INTO privilegio (nombre, descripcion) VALUES ('read_comuna', 'PERMISO DE LEER SOBRE LA TABLA comuna');
INSERT INTO privilegio (nombre, descripcion) VALUES ('update_comuna', 'PERMISO DE ACTUALIZACIÓN SOBRE LA TABLA comuna');
INSERT INTO privilegio (nombre, descripcion) VALUES ('delete_comuna', 'PERMISO DE BORRADO SOBRE LA TABLA comuna');
COMMIT;

INSERT INTO perfil (nombre, descripcion) VALUES ('ADMIN', 'Administrador del sistema');
COMMIT;

INSERT INTO privilegio_perfil (codigo_privilegio, codigo_perfil) VALUES (1, 1);
INSERT INTO privilegio_perfil (codigo_privilegio, codigo_perfil) VALUES (2, 1);
INSERT INTO privilegio_perfil (codigo_privilegio, codigo_perfil) VALUES (3, 1);
INSERT INTO privilegio_perfil (codigo_privilegio, codigo_perfil) VALUES (4, 1);
COMMIT;

INSERT INTO usuario (nombre_usuario, contrasenia, pregunta_1, pregunta_2, codigo_perfil)
VALUES		    ('ju.torres.valenzuela', 'qwerty', NULL, NULL, 1);
COMMIT;

INSERT INTO persona (run, nombres, apellido_paterno,
		     apellido_materno, fecha_nacimiento, telefono, email_principal,
		     email_secundario, nombre_usuario, codigo_estado_civil, codigo_genero)
VALUES		    ('1-9', 'JUAN DIEGO', 'TORRES',
		     'VALENZUELA', TO_DATE('15/08/1985', 'DD/MM/YYYY'), '1234567890', 'a@a.cl',
		     NULL, 'ju.torres.valenzuela', 1, 1);
COMMIT;

INSERT INTO direccion (CODIGO_DIRECCION, CALLE, NUMERO, DEPARTAMENTO, BLOCK, CODIGO_PERSONA, CODIGO_COMUNA)
VALUES		      (1, '5 de abril', '05782', NULL, NULL, 1, 1); 	
COMMIT;