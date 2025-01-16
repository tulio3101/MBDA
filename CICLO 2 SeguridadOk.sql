/*PA_GERENTE_LABORATORIO*/
/*AD_JEFE*/
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(700,'Exael','Pardo',31523,'Exael@123','Activo');
SELECT * FROM JEFESLABORATORIO WHERE correoElectronico = 'Exael@123';
/*MO_JEFE*/
EXECUTE PA_GERENTE_LABORATORIO.MO_JEFE(118,8765);
SELECT * FROM JEFESLABORATORIO WHERE correoElectronico = 'Exael@123';
/*DEL_JEFE*/
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(701,'Exael','Pardo',32323,'Stiven@123','Inactivo');
SELECT * FROM JEFESLABORATORIO WHERE correoElectronico = 'Stiven@123';
EXECUTE PA_GERENTE_LABORATORIO.DEL_JEFE(119);
SELECT * FROM JEFESLABORATORIO WHERE correoElectronico = 'Stiven@123';
/*CO_JEFE_LAB*/
SET SERVEROUTPUT ON;
DECLARE
    cursor_jefes_lab SYS_REFCURSOR;
BEGIN
    cursor_jefes_lab := PA_GERENTE_LABORATORIO.CO_JEFELAB();
    DBMS_SQL.RETURN_RESULT(cursor_jefes_lab);
END;
/*AD_LAB*/
EXECUTE PA_GERENTE_LABORATORIO.AD_LAB(700,'Laboratorio 700','Prado',3456,118);
SELECT * FROM LABORATORIOS WHERE nombre = 'Laboratorio 700';
/*MO_LAB*/
EXECUTE PA_GERENTE_LABORATORIO.MO_LAB(310,'VillaNueva',7658);
SELECT * FROM LABORATORIOS WHERE nombre = 'Laboratorio 700';
/*DEL_LAB*/
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(705,'Nicolas','Pardo',31523,'Nico@123','Activo');
SELECT * FROM JEFESLABORATORIO WHERE correoElectronico = 'Nico@123';
EXECUTE PA_GERENTE_LABORATORIO.AD_LAB(701,'Laboratorio 701',NULL,3456,120);
SELECT * FROM LABORATORIOS WHERE nombre = 'Laboratorio 701';
EXECUTE PA_GERENTE_LABORATORIO.DEL_LAB(311);
SELECT * FROM LABORATORIOS WHERE nombre = 'Laboratorio 701';
/*CO_LAB*/
DECLARE
    cursor_gerente_lab SYS_REFCURSOR;
BEGIN
    cursor_gerente_lab := PA_GERENTE_LABORATORIO.CO_LAB();
    DBMS_SQL.RETURN_RESULT(cursor_gerente_lab);
END;
-- PA_JEFE_LABORATORIO
/*AD_JORNADAS*/
EXECUTE PA_JEFE_LABORATORIO.AD_JORNADAS(700,SYSDATE,'Tunja','Hepatitis B',25);
SELECT * FROM JornadasDeVacunacion WHERE id_jornada = 700;
/*MO_JORNADAS*/
EXECUTE PA_JEFE_LABORATORIO.MO_JORNADAS(700,'Rotavirus');
SELECT * FROM JornadasDeVacunacion WHERE id_jornada = 700;
/*DEL_JORNADAS*/
EXECUTE PA_JEFE_LABORATORIO.AD_JORNADAS(701,SYSDATE+2,'Tenjo','Hepatitis B',0);
EXECUTE PA_JEFE_LABORATORIO.DEL_JORNADAS(701);
SELECT * FROM JornadasDeVacunacion WHERE id_jornada = 701;
/*CO_JORNADAS*/
DECLARE
    cursor_jornadas_vacunacion SYS_REFCURSOR;
BEGIN
    cursor_jornadas_vacunacion := PA_JEFE_LABORATORIO.CO_JORNADAS();
    DBMS_SQL.RETURN_RESULT(cursor_jornadas_vacunacion);
END;
/*AD_PRUEBAS*/
INSERT INTO Diagnosticos VALUES (700,SYSDATE,'Tipo','Preocupante');
EXECUTE PA_JEFE_LABORATORIO.AD_PRUEBAS(700,'Prueba 700',SYSDATE,'Positivo','Pendiente',700);
/*MO_PRUEBAS*/
EXECUTE PA_JEFE_LABORATORIO.MO_PRUEBAS(700,'Completada');
SELECT * FROM PruebaDeLaboratorio WHERE id_prueba = 700;
/*DEL_PRUEBAS*/
EXECUTE PA_JEFE_LABORATORIO.AD_PRUEBAS(704,'Prueba 704',TO_DATE('2023-01-12', 'YYYY-MM-DD'),NULL,'Completada',700);
EXECUTE PA_JEFE_LABORATORIO.DEL_PRUEBAS(704);
/*CO_PRUEBAS*/
DECLARE
    cursor_jefe_pruebas SYS_REFCURSOR;
BEGIN
    cursor_jefe_pruebas := PA_JEFE_LABORATORIO.CO_PRUEBAS();
    DBMS_SQL.RETURN_RESULT(cursor_jefe_pruebas);
END;
/*AD_RESULTADOS*/
EXECUTE PA_JEFE_LABORATORIO.AD_RESULTADOS(800,'resultado 800',SYSDATE);
/*CO_RESULTADOS*/
DECLARE
    cursor_jefe_resultados SYS_REFCURSOR;
BEGIN
    cursor_jefe_resultados := PA_JEFE_LABORATORIO.CO_RESULTADOS();
    DBMS_SQL.RETURN_RESULT(cursor_jefe_resultados);
END;
-- PA_JUNTA_ADMINISTRATIVA
/*CO_CONTENIDO_NOTIFICACIONES*/
DECLARE
    cursor_contenido_notificaciones SYS_REFCURSOR;
BEGIN
    cursor_contenido_notificaciones := PA_JUNTA_ADMINISTRATIVA.CO_CONTENIDO_NOTIFICACIONES();
    DBMS_SQL.RETURN_RESULT(cursor_contenido_notificaciones);
END;
/*CO_RESULTADO_PRUEBAS*/
DECLARE
    cursor_resultado_pruebas SYS_REFCURSOR;
BEGIN
    cursor_resultado_pruebas := PA_JUNTA_ADMINISTRATIVA.CO_RESULTADO_PRUEBAS();
    DBMS_SQL.RETURN_RESULT(cursor_resultado_pruebas);
END;
/*CO_TIPOS_VACUNAS*/
DECLARE
    cursor_tipos_vacunas SYS_REFCURSOR;
BEGIN
    cursor_tipos_vacunas := PA_JUNTA_ADMINISTRATIVA.CO_TIPOS_VACUNAS();
    DBMS_SQL.RETURN_RESULT(cursor_tipos_vacunas);
END;
/*CO_JEFE_RESPONSABLE*/
DECLARE
    cursor_jefe_responsable SYS_REFCURSOR;
BEGIN
    cursor_jefe_responsable := PA_JUNTA_ADMINISTRATIVA.CO_JEFE_RESPONSABLE();
    DBMS_SQL.RETURN_RESULT(cursor_jefe_responsable);
END;
-------------------- PA_SECRETARIO
/*AD_NOTI*/
INSERT INTO JefesLaboratorio (id_jefe, nombre, apellido, telefono, correoElectronico, estado) VALUES(800, 'JefeNombre_800', 'JefeApellido_800', 5551060, 'jefe800@hospital.com', 'Activo');
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Carlos', 'Perez', 800, 'c.perez@800.com', 'Tarjeta', 'Madrid');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Juan', 'Garcia', 800, 'j.800rcia@hospital.com', 987654321, 'Activo', 800);
INSERT INTO JornadasDeVacunacion (id_jornada, fecha, lugar, tipoDeVacuna, cantidadVacunasDisponibles) VALUES(800, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'Plaza Mayor 800', 'Vacuna BCG', 50);
INSERT INTO ResultadoPruebas (id_resultado, resultado, fechaRegistro) VALUES (850, 'Negativo', TO_DATE('2024-03-26', 'YYYY-MM-DD'));
SELECT * FROM JefesLaboratorio WHERE correoElectronico = 'jefe800@hospital.com';
EXECUTE PC_NOTIFICACIONES.AD_NOTI(800, XMLTYPE('<mensaje>Vacunación programada para el 2024-03-10 en Plaza Mayor.</mensaje>'), 800, 800, 850, 121, 800);
/*CO_NOTI*/
DECLARE
    cursor_co_noti SYS_REFCURSOR;
BEGIN
    cursor_co_noti := PA_SECRETARIO.CO_NOTI();
    DBMS_SQL.RETURN_RESULT(cursor_co_noti);
END;