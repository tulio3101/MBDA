-- Mantener Jefes de Laboratorios
-- Adicionar
INSERT INTO JefesLaboratorio VALUES (63,'Juan','Riaño',567,'Juan@123','Activo');
-- Modificar
INSERT INTO JefesLaboratorio VALUES (64,'Julian','Riaño',523,'Juan@567','Activo');
UPDATE JefesLaboratorio SET telefono = 678 WHERE correoElectronico = 'Juan@567';
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Juan@567';
-- Eliminar
INSERT INTO JefesLaboratorio VALUES (65,'Julian','Riaño',568,'Juan@565','Inactivo');
DELETE FROM JefesLaboratorio WHERE correoElectronico = 'Juan@565';
-- Mantener Laboratorios
-- Adicionar
INSERT INTO JefesLaboratorio VALUES (100,'Julian','Riaño',100,'Julian@100','Activo');
/*Necesitamos conocer el id del jefe de laboratorio*/
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Julian@100';
INSERT INTO Laboratorios VALUES (100,'Laboratorio 66','Sopó',1456,103);
/*Tener en cuenta que el id del jefe de laboratorio es autogenerado, por lo que deberíamos actualizar este valor para poder hacer sus otras operaciones*/
-- Modificar
INSERT INTO JefesLaboratorio VALUES (67,'Julian','Riaño',598,'Julian@867','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Julian@867';
INSERT INTO Laboratorios VALUES (67,'Laboratorio 67','Sopó',1456,104);
UPDATE Laboratorios SET direccion = 'Bogotá' WHERE nombre = 'Laboratorio 67';
SELECT * FROM Laboratorios WHERE id_jefe = 104;
-- Eliminar
INSERT INTO JefesLaboratorio VALUES (68,'Julian','Riaño',598,'Julian@868','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Julian@868';
INSERT INTO Laboratorios VALUES (68,'Laboratorio 68',NULL,1456,105);

DELETE FROM Laboratorios WHERE id_jefe = 105;
-- Mantener Jornadas de Vacunacion
-- Adicionar
INSERT INTO JornadasDeVacunacion VALUES (69,TO_DATE('2023-01-10', 'YYYY-MM-DD'),'Central','Hepatitis B',25);
-- Modificar
INSERT INTO JornadasDeVacunacion VALUES (70,TO_DATE('2023-01-12', 'YYYY-MM-DD'),'Norte','Hepatitis B',30);
UPDATE JornadasDeVacunacion SET tipoDeVacuna = 'Pentavalente' WHERE id_jornada = 70;
-- Eliminar
INSERT INTO JornadasDeVacunacion VALUES (71,TO_DATE('2023-01-14', 'YYYY-MM-DD'),'Sur','Hepatitis B',0);
DELETE FROM JornadasDeVacunacion WHERE id_jornada = 71;
-- Mantener Pruebas de Laboratorio
-- Adicionar
INSERT INTO Diagnosticos (diagnostico_id, fechaDiagnostico, tipoDiagnostico, descripcion) VALUES (51, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Inicial', 'Dolor abdom');
INSERT INTO PruebaDeLaboratorio VALUES (61,'Control',TO_DATE('2023-01-11', 'YYYY-MM-DD'),NULL,'Pendiente',51);
-- Modificar
INSERT INTO Diagnosticos (diagnostico_id, fechaDiagnostico, tipoDiagnostico, descripcion) VALUES (54, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Inicial', 'Dolor abdom');
INSERT INTO PruebaDeLaboratorio VALUES (64,'Control',TO_DATE('2023-01-12', 'YYYY-MM-DD'),NULL,'Pendiente',54);
UPDATE PruebaDeLaboratorio SET estado = 'Completada' WHERE id_prueba = 64;
-- Eliminar
DELETE FROM PruebaDeLaboratorio WHERE id_prueba = 64;