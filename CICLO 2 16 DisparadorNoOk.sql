-- Mantener Jefes de Laboratorios
-- Modificar
INSERT INTO JefesLaboratorio VALUES (80,'Julian','Riaño',523,'Juan@580','Activo');
UPDATE JefesLaboratorio SET nombre = 'Pedro' WHERE correoElectronico = 'Juan@580';
-- Eliminar
INSERT INTO JefesLaboratorio VALUES (81,'Julian','Riaño',568,'Juan@581','Activo');
DELETE FROM JefesLaboratorio WHERE correoElectronico = 'Juan@581';
-- Mantener Laboratorios
-- Modificar
INSERT INTO JefesLaboratorio VALUES (82,'Julian','Riaño',598,'Julian@882','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Julian@882';
INSERT INTO Laboratorios VALUES (189,'Laboratorio 189','Sopó',1456,108);

UPDATE Laboratorios SET nombre = 'Laboratorio 83' WHERE id_jefe = 108;

-- Eliminar
INSERT INTO JefesLaboratorio VALUES (83,'Julian','Riaño',598,'Julian@382','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Julian@382';
INSERT INTO Laboratorios VALUES (83,'Laboratorio 68','Casa',1456,109);

DELETE FROM Laboratorios WHERE nombre = 'Laboratorio 68';
-- Mantener Jornadas de Vacunacion
-- Adicionar
INSERT INTO JornadasDeVacunacion VALUES (84,NULL,NULL,'Hepatitis B',25);
-- Modificar
INSERT INTO JornadasDeVacunacion VALUES (85,TO_DATE('2023-01-21', 'YYYY-MM-DD'),'Norte 1','Hepatitis B',30);
UPDATE JornadasDeVacunacion SET id_jornada = 85;
-- Eliminar
INSERT INTO JornadasDeVacunacion VALUES (87,TO_DATE('2023-03-10', 'YYYY-MM-DD'),'Sur','Hepatitis B',32);
DELETE FROM JornadasDeVacunacion WHERE id_jornada = 87;
-- Mantener Pruebas de Laboratorio
-- Modificar
INSERT INTO Diagnosticos (diagnostico_id, fechaDiagnostico, tipoDiagnostico, descripcion) VALUES (200, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Inicial', 'Dolor abdom');
INSERT INTO PruebaDeLaboratorio VALUES (91,'Control',SYSDATE,NULL,'Pendiente',200);
UPDATE PruebaDeLaboratorio SET id_prueba = 91 WHERE id_prueba = 91;
-- Eliminar
DELETE FROM PruebaDeLaboratorio WHERE id_prueba = 91;
