-- PC_JEFE_LABORATORIO
/*AD_JEFE*/
EXECUTE PC_JEFE_LABORATORIO.AD_JEFE(500,'Pedro','Rodriguez',3123,'Pedro@321','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Pedro@321';
/*MO_JEFE*/
EXECUTE PC_JEFE_LABORATORIO.MO_JEFE(110,91423);
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Pedro@321';
/*DEL_JEFE*/
EXECUTE PC_JEFE_LABORATORIO.AD_JEFE(500,'PruebaN','Rodriguez',3123,'Prueba@321','Inactivo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Prueba@321';
EXECUTE PC_JEFE_LABORATORIO.DEL_JEFE(111);
/*CO_JEFE*/
DECLARE
    cursor_jefe_laboratorio SYS_REFCURSOR;
BEGIN
    cursor_jefe_laboratorio := PC_JEFE_LABORATORIO.CO_JEFELAB();
    DBMS_SQL.RETURN_RESULT(cursor_jefe_laboratorio);
END;
-- PC_LABORATORIOS
/*AD_LAB*/
EXECUTE PC_LABORATORIOS.AD_LAB(500,'Laboratorio 500','Santa Fe',111,110);
SELECT * FROM Laboratorios WHERE id_jefe = 110;
/*MO_LAB*/
EXECUTE PC_LABORATORIOS.MO_LAB(305,'Candelaria',131);
SELECT * FROM Laboratorios WHERE id_jefe = 110;
/*DEL_LAB*/
EXECUTE PC_JEFE_LABORATORIO.AD_JEFE(501,'Pedro','Rodriguez',3123,'Pedro@51','Activo');
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'Pedro@51';
EXECUTE PC_LABORATORIOS.AD_LAB(501,'Laboratorio 501',NULL,321,112);
SELECT * FROM Laboratorios WHERE id_jefe = 112;
EXECUTE PC_LABORATORIOS.DEL_LAB(306);
/*CO_LAB*/
DECLARE
    cursor_laboratorio SYS_REFCURSOR;
BEGIN
    cursor_laboratorio := PC_LABORATORIOS.CO_LAB();
    DBMS_SQL.RETURN_RESULT(cursor_laboratorio);
END;
-- PC_JORNADAS_DE_VACUNACION
/*AD_JORNADAS*/
EXECUTE PC_JORNADAS_DE_VACUNACION.AD_JORNADAS(500,SYSDATE,'Paloquemeao','Hepatitis B',25);
/*MO_JORNADAS*/
EXECUTE PC_JORNADAS_DE_VACUNACION.MO_JORNADAS(500,'Vacuna BCG');
/*DEL_JORNADAS*/
EXECUTE PC_JORNADAS_DE_VACUNACION.AD_JORNADAS(501,SYSDATE,'Simon Bolivar','Vacuna BCG',0);
EXECUTE PC_JORNADAS_DE_VACUNACION.DEL_JORNADAS(501);
/*CO_JORNADAS*/
DECLARE
    cursor_jornadas_de_vacunacion SYS_REFCURSOR;
BEGIN
    cursor_jornadas_de_vacunacion := PC_JORNADAS_DE_VACUNACION.CO_JORNADAS();
    DBMS_SQL.RETURN_RESULT(cursor_jornadas_de_vacunacion);
END;
-- PC_RESULTADOS_PRUEBAS
/*AD_RESULTADOS*/
EXECUTE PC_RESULTADO_PRUEBAS.AD_RESULTADOS(500,'Positivo Hepatitis',SYSDATE);
/*CO_RESULTADOS*/
DECLARE
    cursor_pruebas SYS_REFCURSOR;
BEGIN
    cursor_pruebas := PC_RESULTADO_PRUEBAS.CO_RESULTADOS();
    DBMS_SQL.RETURN_RESULT(cursor_pruebas);
END;
/*PC_NOTIFICACIONES*/
/*AD_NOTI*/
INSERT INTO JefesLaboratorio (id_jefe, nombre, apellido, telefono, correoElectronico, estado) VALUES(600, 'JefeNombre_601', 'JefeApellido_601', 5551060, 'jefe601@hospital.com', 'Activo');
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Carlos', 'Perez', 600, 'c.perez@600.com', 'Tarjeta', 'Madrid');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Juan', 'Garcia', 600, 'j.600rcia@hospital.com', 987654321, 'Activo', 600);
INSERT INTO JornadasDeVacunacion (id_jornada, fecha, lugar, tipoDeVacuna, cantidadVacunasDisponibles) VALUES(600, TO_DATE('2024-03-27', 'YYYY-MM-DD'), 'Plaza Mayor 0', 'Vacuna BCG', 50);
INSERT INTO ResultadoPruebas (id_resultado, resultado, fechaRegistro) VALUES (600, 'Negativo', TO_DATE('2024-03-26', 'YYYY-MM-DD'));
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'jefe601@hospital.com';
EXECUTE PC_NOTIFICACIONES.AD_NOTI(600, XMLTYPE('<mensaje>Vacunación programada para el 2024-03-10 en Plaza Mayor.</mensaje>'), 600, 600, 600, 113, 600);
/*CO_NOTI*/
DECLARE
    cursor_noti SYS_REFCURSOR;
BEGIN
    cursor_noti := PC_NOTIFICACIONES.CO_NOTI();
    DBMS_SQL.RETURN_RESULT(cursor_noti);
END;