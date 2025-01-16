--PA_GERENTE_LABORATORIO
CREATE OR REPLACE PACKAGE BODY PA_GERENTE_LABORATORIO IS 
    PROCEDURE AD_JEFE(x_id_jefe IN NUMBER, x_nombre IN VARCHAR, x_apellido IN VARCHAR, x_telefono NUMBER, x_correoElectronico IN VARCHAR, x_estado IN VARCHAR) IS
        BEGIN PC_JEFE_LABORATORIO.AD_JEFE(x_id_jefe, x_nombre, x_apellido, x_telefono, x_correoElectronico, x_estado);
        END;

    PROCEDURE MO_JEFE(x_id_jefe IN NUMBER,x_telefono IN NUMBER) IS
        BEGIN PC_JEFE_LABORATORIO.MO_JEFE(x_id_jefe,x_telefono);
        END;

    PROCEDURE DEL_JEFE(x_id_jefe IN NUMBER) IS
        BEGIN PC_JEFE_LABORATORIO.DEL_JEFE(x_id_jefe);
        END;

    FUNCTION CO_JEFELAB RETURN SYS_REFCURSOR IS CO_BOSS SYS_REFCURSOR;
    BEGIN 
        CO_BOSS := PC_JEFE_LABORATORIO.CO_JEFELAB;
        RETURN CO_BOSS;
    END;

    PROCEDURE AD_LAB(x_id_laboratorio IN NUMBER,x_nombre IN VARCHAR,x_direccion IN VARCHAR,x_contacto IN NUMBER, x_id_jefe IN NUMBER) IS
        BEGIN PC_LABORATORIOS.AD_LAB(x_id_laboratorio,x_nombre,x_direccion,x_contacto,x_id_jefe);
        END;

    PROCEDURE MO_LAB(x_id_laboratorio IN NUMBER,x_direccion  IN VARCHAR,x_contacto IN NUMBER)IS 
        BEGIN PC_LABORATORIOS.MO_LAB(x_id_laboratorio,x_direccion,x_contacto);
        END;

    PROCEDURE DEL_LAB(x_id_laboratorio IN NUMBER) IS
        BEGIN PC_LABORATORIOS.DEL_LAB(x_id_laboratorio);
        END;
    
    FUNCTION CO_LAB RETURN SYS_REFCURSOR IS CO_LABSS SYS_REFCURSOR;
    BEGIN 
        CO_LABSS := PC_LABORATORIOS.CO_LAB;
        RETURN CO_LABSS;
    END;

END PA_GERENTE_LABORATORIO;
/
-- PA_JEFE_LABORATORIO
CREATE OR REPLACE PACKAGE BODY PA_JEFE_LABORATORIO IS
    PROCEDURE AD_JORNADAS(x_id_jornada IN NUMBER,x_fecha IN DATE,x_lugar IN VARCHAR,x_tipoDeVacuna IN VARCHAR,x_cantidadVacunasDisponibles IN NUMBER) IS
    BEGIN
        PC_JORNADAS_DE_VACUNACION.AD_JORNADAS(x_id_jornada, x_fecha, x_lugar, x_tipoDeVacuna, x_cantidadVacunasDisponibles);
    END;

    PROCEDURE MO_JORNADAS(x_id_jornada IN NUMBER,x_tipoDeVacuna IN VARCHAR) IS
    BEGIN
        PC_JORNADAS_DE_VACUNACION.MO_JORNADAS(x_id_jornada, x_tipoDeVacuna);
    END;

    PROCEDURE DEL_JORNADAS(x_id_jornada IN NUMBER) IS
    BEGIN
        PC_JORNADAS_DE_VACUNACION.DEL_JORNADAS(x_id_jornada);
    END;

    FUNCTION CO_JORNADAS RETURN SYS_REFCURSOR IS CO_VACCINATION SYS_REFCURSOR;
    BEGIN
        CO_VACCINATION := PC_JORNADAS_DE_VACUNACION.CO_JORNADAS;
        RETURN CO_VACCINATION;
    END;

    PROCEDURE AD_PRUEBAS(x_id_prueba IN NUMBER,x_tipoDePrueba IN VARCHAR,x_fecha_realizacion IN DATE,x_resultadoPrevio IN VARCHAR,x_estado IN VARCHAR,x_id_diagnostico IN NUMBER) IS
    BEGIN
        PC_PRUEBAS_DE_LABORATORIO.AD_PRUEBAS(x_id_prueba, x_tipoDePrueba, x_fecha_realizacion, x_resultadoPrevio, x_estado, x_id_diagnostico);
    END;

    PROCEDURE MO_PRUEBAS(x_id_prueba IN NUMBER,x_estado IN VARCHAR) IS
    BEGIN
        PC_PRUEBAS_DE_LABORATORIO.MO_PRUEBAS(x_id_prueba, x_estado);
    END;

    PROCEDURE DEL_PRUEBAS(x_id_prueba IN NUMBER) IS
    BEGIN
        PC_PRUEBAS_DE_LABORATORIO.DEL_PRUEBAS(x_id_prueba);
    END;

    FUNCTION CO_PRUEBAS RETURN SYS_REFCURSOR IS CO_TEST SYS_REFCURSOR;
    BEGIN
        CO_TEST := PC_PRUEBAS_DE_LABORATORIO.CO_PRUEBAS;
        RETURN CO_TEST;
    END;

    PROCEDURE AD_RESULTADOS(x_id_resultados IN NUMBER,x_resultado IN VARCHAR,x_fechaRegistro IN DATE) IS
    BEGIN
        PC_RESULTADO_PRUEBAS.AD_RESULTADOS(x_id_resultados, x_resultado, x_fechaRegistro);
    END;

    FUNCTION CO_RESULTADOS RETURN SYS_REFCURSOR IS CO_RESULTS SYS_REFCURSOR;
    BEGIN
        CO_RESULTS := PC_RESULTADO_PRUEBAS.CO_RESULTADOS;
        RETURN CO_RESULTS;
    END;
END PA_JEFE_LABORATORIO;
/
--PA_JUNTA_ADMINISTRATIVA
CREATE OR REPLACE PACKAGE BODY PA_JUNTA_ADMINISTRATIVA IS

    FUNCTION CO_CONTENIDO_NOTIFICACIONES RETURN SYS_REFCURSOR IS
        cursor_contenido_notificaciones SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_contenido_notificaciones FOR 
            SELECT * FROM Notificaciones;
        RETURN cursor_contenido_notificaciones;
    END CO_CONTENIDO_NOTIFICACIONES;

    FUNCTION CO_RESULTADO_PRUEBAS RETURN SYS_REFCURSOR IS
        cursor_resultados_pruebas SYS_REFCURSOR;
    BEGIN
        OPEN cursor_resultados_pruebas FOR 
            SELECT * FROM ResultadoPruebas;
        RETURN cursor_resultados_pruebas;
    END CO_RESULTADO_PRUEBAS;

    FUNCTION CO_TIPOS_VACUNAS RETURN SYS_REFCURSOR IS
        cursor_vacunas SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_vacunas FOR 
            SELECT tipoDeVacuna, cantidadVacunasDisponibles FROM JornadasDeVacunacion;
        RETURN cursor_vacunas;
    END CO_TIPOS_VACUNAS;

    FUNCTION CO_JEFE_RESPONSABLE RETURN SYS_REFCURSOR IS 
        cursor_jefe_responsable SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_jefe_responsable FOR 
            SELECT id_jefe, nombre, apellido, telefono FROM JefesLaboratorio;
        RETURN cursor_jefe_responsable;
    END CO_JEFE_RESPONSABLE;

END PA_JUNTA_ADMINISTRATIVA;
/
--PA_SECRETARIO
CREATE OR REPLACE PACKAGE BODY PA_SECRETARIO IS 
    PROCEDURE AD_NOTI(x_id_notificacion IN NUMBER,x_contenido IN XMLTYPE, x_id_jornada_notificaciones IN NUMBER, x_identificacion_medicos IN NUMBER, x_id_resultado IN NUMBER, x_id_jefe IN NUMBER, x_id_paciente IN NUMBER) IS
    BEGIN
        PC_NOTIFICACIONES.AD_NOTI(x_id_notificacion,x_contenido, x_id_jornada_notificaciones, x_identificacion_medicos, x_id_resultado, x_id_jefe, x_id_paciente);
    END;

    FUNCTION CO_NOTI RETURN SYS_REFCURSOR IS
        CO_NOTIFICATIONS SYS_REFCURSOR;
    BEGIN 
        CO_NOTIFICATIONS := PC_NOTIFICACIONES.CO_NOTI;
        RETURN CO_NOTIFICATIONS;
    END;
END PA_SECRETARIO;
/