-- PC_JEFE_LABORATORIO
/*AD_JEFE*/
EXECUTE PC_JEFE_LABORATORIO.AD_JEFE(110,'Pedro','Rodriguez',3123,'Pedro@321','Activo');
/*MO_JEFE*/
EXECUTE PC_JEFE_LABORATORIO.MO_JEFE(110,'hola');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Pedro@321';
/*DEL_JEFE*/
EXECUTE PC_JEFE_LABORATORIO.AD_JEFE(503,'PruebaN','Rodriguez',3123,'Prueba@321','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Prueba@321';
EXECUTE PC_JEFE_LABORATORIO.DEL_JEFE(115);
-- PC_LABORATORIOS
/*AD_LAB*/
EXECUTE PC_LABORATORIOS.AD_LAB(305,'Laboratorio 302','Santa Fe',111,110);
EXECUTE PC_LABORATORIOS.AD_LAB(305,'Laboratorio 302','Santa Fe',111,110);
SELECT * FROM Laboratorios WHERE id_jefe = 110;
/*MO_LAB*/
EXECUTE PC_LABORATORIOS.MO_LAB(307,'Laboratorio 302','Candelaria',131);
SELECT * FROM Laboratorios WHERE id_jefe = 110;
/*DEL_LAB*/
EXECUTE PC_JEFE_LABORATORIO.AD_JEFE(504,'Pedro','Rodriguez',3123,'Pedro@52','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Pedro@52';
EXECUTE PC_LABORATORIOS.AD_LAB(504,'Laboratorio 504','Santander',321,116);
SELECT * FROM Laboratorios WHERE id_jefe = 116;
EXECUTE PC_LABORATORIOS.DEL_LAB(309);
-- PC_JORNADAS_DE_VACUNACION
/*AD_JORNADAS*/
EXECUTE PC_JORNADAS_DE_VACUNACION.AD_JORNADAS(500,SYSDATE,'Paloquemeao','Hepatitis B',25);
/*MO_JORNADAS*/
EXECUTE PC_JORNADAS_DE_VACUNACION.MO_JORNADAS(500,'Vac');
/*DEL_JORNADAS*/
EXECUTE PC_JORNADAS_DE_VACUNACION.DEL_JORNADAS(500);
-- PC_RESULTADOS_PRUEBAS
/*AD_RESULTADOS*/
EXECUTE PC_RESULTADO_PRUEBAS.AD_RESULTADOS(500,'Positivo Hepatitis',SYSDATE);
/*PC_NOTIFICACIONES*/
/*AD_NOTI*/
INSERT INTO JefesLaboratorio (id_jefe, nombre, apellido, telefono, correoElectronico, estado) VALUES(602, 'JefeNombre_602', 'JefeApellido_602', 5551060, 'jefe602@hospital.com', 'Activo');
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Carlos', 'Perez', 602, 'c.perez@602.com', 'Tarjeta', 'Madrid');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Juan', 'Garcia', 602, 'j.602rcia@hospital.com', 987654321, 'Activo', 602);
INSERT INTO JornadasDeVacunacion (id_jornada, fecha, lugar, tipoDeVacuna, cantidadVacunasDisponibles) VALUES(602, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'Plaza Mayor 602', 'Vacuna BCG', 50);
INSERT INTO ResultadoPruebas (id_resultado, resultado, fechaRegistro) VALUES (602, 'Negativo', TO_DATE('2024-03-29', 'YYYY-MM-DD'));
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'jefe602@hospital.com';
EXECUTE PC_NOTIFICACIONES.AD_NOTI(600, XMLTYPE('<mensaje>Vacunación programada para el 2024-03-10 en Plaza Mayor.</mensaje>'), 601, 640, 600, 117, 600);