CREATE OR REPLACE PACKAGE BODY PC_JEFE_LABORATORIO IS

    PROCEDURE AD_JEFE(x_id_jefe IN NUMBER,x_nombre IN VARCHAR,x_apellido IN VARCHAR, x_telefono IN NUMBER, x_correoElectronico IN VARCHAR,x_estado IN VARCHAR) IS
    BEGIN 
        INSERT INTO JefesLaboratorio(id_jefe, nombre, apellido, telefono, correoElectronico, estado) 
        VALUES (x_id_jefe, x_nombre, x_apellido, x_telefono, x_correoElectronico, x_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20111, 'Error al insertar en Jefes Laboratorio');
    END AD_JEFE;

    PROCEDURE MO_JEFE(x_id_jefe IN NUMBER,x_telefono IN NUMBER) IS
    BEGIN
        UPDATE JefesLaboratorio 
        SET telefono = x_telefono 
        WHERE id_jefe = x_id_jefe;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20112, 'Error al modificar en Jefes Laboratorio');
    END MO_JEFE;

    PROCEDURE DEL_JEFE(x_id_jefe IN NUMBER) IS
    BEGIN
        DELETE FROM JefesLaboratorio
        WHERE id_jefe = x_id_jefe;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20113, 'Error al eliminar en JefesLaboratorio');
    END DEL_JEFE;

    FUNCTION CO_JEFELAB RETURN SYS_REFCURSOR IS
        cursor_jefe SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_jefe FOR 
            SELECT * FROM JefesLaboratorio
            WHERE estado = 'Activo';
        RETURN cursor_jefe;
    END CO_JEFELAB;

END PC_JEFE_LABORATORIO;
/
----------
CREATE OR REPLACE PACKAGE BODY PC_LABORATORIOS IS 

    PROCEDURE AD_LAB(x_id_laboratorio IN NUMBER,x_nombre IN VARCHAR,x_direccion IN VARCHAR,x_contacto NUMBER,x_id_jefe IN NUMBER) IS
    BEGIN 
        INSERT INTO Laboratorios(id_laboratorio, nombre, direccion, contacto,id_jefe) 
        VALUES (x_id_laboratorio, x_nombre, x_direccion, x_contacto,x_id_jefe);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20111, 'Error al insertar en Laboratorios');
    END AD_LAB;

    PROCEDURE MO_LAB(x_id_laboratorio IN NUMBER,x_direccion IN VARCHAR,x_contacto IN NUMBER) IS
    BEGIN 
        UPDATE Laboratorios 
        SET direccion = x_direccion, 
            contacto  = x_contacto 
        WHERE id_laboratorio = x_id_laboratorio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20112, 'Error al modificar Laboratorios');
    END MO_LAB;

    PROCEDURE DEL_LAB(x_id_laboratorio IN NUMBER) IS
    BEGIN
        DELETE FROM Laboratorios
        WHERE id_laboratorio = x_id_laboratorio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20113, 'Error al eliminar en Laboratorios');
    END DEL_LAB;
    
    FUNCTION CO_LAB RETURN SYS_REFCURSOR IS
        cursor_laboratorios SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_laboratorios FOR
            SELECT * FROM Laboratorios;
        RETURN cursor_laboratorios;
    END CO_LAB;

END PC_LABORATORIOS;
/
-----------------------
CREATE OR REPLACE PACKAGE BODY PC_JORNADAS_DE_VACUNACION IS

    PROCEDURE AD_JORNADAS(x_id_jornada IN NUMBER,x_fecha IN DATE,x_lugar IN VARCHAR,x_tipoDeVacuna IN VARCHAR,x_cantidadVacunasDisponibles IN NUMBER) IS
    BEGIN 
        INSERT INTO JornadasDeVacunacion(id_jornada, fecha, lugar, tipoDeVacuna, cantidadVacunasDisponibles) 
        VALUES (x_id_jornada, x_fecha, x_lugar, x_tipoDeVacuna, x_cantidadVacunasDisponibles);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20114, 'Error al insertar en JornadasDeVacunacion');
    END AD_JORNADAS;

    PROCEDURE MO_JORNADAS(x_id_jornada IN NUMBER,x_tipoDeVacuna IN VARCHAR) IS
    BEGIN 
        UPDATE JornadasDeVacunacion 
        SET tipoDeVacuna = x_tipoDeVacuna 
        WHERE id_jornada = x_id_jornada;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20115, 'Error al modificar JornadasDeVacunacion');
    END MO_JORNADAS;
    
    PROCEDURE DEL_JORNADAS(x_id_jornada IN NUMBER) IS
    BEGIN
        DELETE FROM JornadasDeVacunacion
            WHERE id_jornada = x_id_jornada;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20113, 'Error al eliminar Jornada de vacunacion');
    END DEL_JORNADAS;
    
    FUNCTION CO_JORNADAS RETURN SYS_REFCURSOR IS
        cursor_jornadas SYS_REFCURSOR;
    BEGIN
        OPEN cursor_jornadas FOR
            SELECT * FROM JornadasDeVacunacion;
        RETURN cursor_jornadas;
    END CO_JORNADAS;

END PC_JORNADAS_DE_VACUNACION;
/
-------------------------
CREATE OR REPLACE PACKAGE BODY PC_PRUEBAS_DE_LABORATORIO IS 
    PROCEDURE AD_PRUEBAS(x_id_prueba IN NUMBER,x_tipoDePrueba IN VARCHAR,x_fecha_realizacion IN DATE,x_resultadoPrevio IN VARCHAR,x_estado IN VARCHAR,x_id_diagnostico IN NUMBER) IS
    BEGIN 
        INSERT INTO PruebaDeLaboratorio(id_prueba,tipoDePrueba,fecha_realizacion,resultadoPrevio,estado,id_diagnostico) VALUES (x_id_prueba,x_tipoDePrueba,x_fecha_realizacion,x_resultadoPrevio,x_estado,x_id_diagnostico);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20114, 'Error al insertar en Prueba de Laboratorio');
    END;

    PROCEDURE MO_PRUEBAS(x_id_prueba IN NUMBER,x_estado IN VARCHAR) IS
    BEGIN 
        UPDATE PruebaDeLaboratorio SET estado = x_estado WHERE id_prueba = x_id_prueba;
           COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20112, 'Error al modificar Pruebas de Laboratorio');
    END;

    PROCEDURE DEL_PRUEBAS(x_id_prueba IN NUMBER) IS
    BEGIN
        DELETE FROM PruebaDeLaboratorio
        WHERE id_prueba = x_id_prueba;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20113, 'Error al eliminar en PruebaDeLaboratorios');
    END;

     FUNCTION CO_PRUEBAS RETURN SYS_REFCURSOR IS
        cursor_pruebas SYS_REFCURSOR;
    BEGIN
        OPEN cursor_pruebas FOR
            SELECT * from PruebaDeLaboratorio;
        RETURN cursor_pruebas;
    END CO_PRUEBAS;

END PC_PRUEBAS_DE_LABORATORIO;
/
------------------------------------

CREATE OR REPLACE PACKAGE BODY PC_RESULTADO_PRUEBAS IS 

    PROCEDURE AD_RESULTADOS(x_id_resultados IN NUMBER,x_resultado IN VARCHAR,x_fechaRegistro IN DATE) IS
    BEGIN 
        INSERT INTO ResultadoPruebas(id_resultado, resultado, fechaRegistro) 
        VALUES (x_id_resultados, x_resultado, x_fechaRegistro);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20119, 'Error al insertar en ResultadoPruebas');
    END AD_RESULTADOS;

    FUNCTION CO_RESULTADOS RETURN SYS_REFCURSOR IS 
        cursor_resultados SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_resultados FOR
            SELECT R.resultado,R.fechaRegistro,O.observacion FROM ResultadoPruebas R JOIN Observaciones O ON (R.id_resultado = O.id_resultado);
        RETURN cursor_resultados;
    END CO_RESULTADOS;

END PC_RESULTADO_PRUEBAS;
/
---------------------------
CREATE OR REPLACE PACKAGE BODY PC_NOTIFICACIONES IS

    PROCEDURE AD_NOTI(x_id_notificacion IN NUMBER,x_contenido IN XMLTYPE, x_id_jornada_notificaciones IN NUMBER, x_identificacion_medicos IN NUMBER, x_id_resultado IN NUMBER, x_id_jefe IN NUMBER, x_id_paciente IN NUMBER) IS
    BEGIN 
        INSERT INTO Notificaciones(id_notificacion, contenido, id_jornada_notificaciones, identificacion_medicos, id_resultado, id_jefe, id_paciente) 
        VALUES (x_id_notificacion,x_contenido, x_id_jornada_notificaciones, x_identificacion_medicos, x_id_resultado, x_id_jefe, x_id_paciente);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20120, 'Error al insertar en Notificaciones');
    END AD_NOTI;

    FUNCTION CO_NOTI RETURN SYS_REFCURSOR IS
        cursor_notificaciones SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_notificaciones FOR
            SELECT * FROM Notificaciones;
        RETURN cursor_notificaciones;
    END CO_NOTI;

END PC_NOTIFICACIONES;
/