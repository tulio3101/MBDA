-- PA_GERENTE_LABORATORIO
CREATE OR REPLACE PACKAGE PA_GERENTE_LABORATORIO IS 
    PROCEDURE AD_JEFE(x_id_jefe IN NUMBER, x_nombre IN VARCHAR, x_apellido IN VARCHAR, x_telefono NUMBER, x_correoElectronico IN VARCHAR, x_estado IN VARCHAR);
    PROCEDURE MO_JEFE(x_id_jefe IN NUMBER,x_telefono IN NUMBER);
    PROCEDURE DEL_JEFE(x_id_jefe IN NUMBER);
    FUNCTION CO_JEFELAB RETURN SYS_REFCURSOR;
    PROCEDURE AD_LAB(x_id_laboratorio IN NUMBER,x_nombre IN VARCHAR,x_direccion IN VARCHAR,x_contacto IN NUMBER, x_id_jefe IN NUMBER);
    PROCEDURE MO_LAB(x_id_laboratorio IN NUMBER,x_direccion  IN VARCHAR,x_contacto IN NUMBER);
    PROCEDURE DEL_LAB(x_id_laboratorio IN NUMBER);
    FUNCTION CO_LAB RETURN SYS_REFCURSOR;
END PA_GERENTE_LABORATORIO;
/
--PA_JEFE_LABORATORIO
CREATE OR REPLACE PACKAGE PA_JEFE_LABORATORIO IS
    PROCEDURE AD_JORNADAS(x_id_jornada IN NUMBER,x_fecha IN DATE,x_lugar IN VARCHAR,x_tipoDeVacuna IN VARCHAR,x_cantidadVacunasDisponibles IN NUMBER);
    PROCEDURE MO_JORNADAS(x_id_jornada IN NUMBER,x_tipoDeVacuna IN VARCHAR);
    PROCEDURE DEL_JORNADAS(x_id_jornada IN NUMBER);
    FUNCTION CO_JORNADAS RETURN SYS_REFCURSOR;
    PROCEDURE AD_PRUEBAS(x_id_prueba IN NUMBER,x_tipoDePrueba IN VARCHAR,x_fecha_realizacion IN DATE,x_resultadoPrevio IN VARCHAR,x_estado IN VARCHAR,x_id_diagnostico IN NUMBER);
    PROCEDURE MO_PRUEBAS(x_id_prueba IN NUMBER,x_estado IN VARCHAR);
    PROCEDURE DEL_PRUEBAS(x_id_prueba IN NUMBER);
    FUNCTION CO_PRUEBAS RETURN SYS_REFCURSOR;
    PROCEDURE AD_RESULTADOS(x_id_resultados IN NUMBER,x_resultado IN VARCHAR,x_fechaRegistro IN DATE);
    FUNCTION CO_RESULTADOS RETURN SYS_REFCURSOR;
END PA_JEFE_LABORATORIO;
/
--PA_JUNTA_ADMINISTRATIVA
CREATE OR REPLACE PACKAGE PA_JUNTA_ADMINISTRATIVA IS
    FUNCTION CO_CONTENIDO_NOTIFICACIONES RETURN SYS_REFCURSOR;
    FUNCTION CO_RESULTADO_PRUEBAS RETURN SYS_REFCURSOR;
    FUNCTION CO_TIPOS_VACUNAS RETURN SYS_REFCURSOR;
    FUNCTION CO_JEFE_RESPONSABLE RETURN SYS_REFCURSOR;
END PA_JUNTA_ADMINISTRATIVA;
/
--PA_SECRETARIO
CREATE OR REPLACE PACKAGE PA_SECRETARIO IS 
    PROCEDURE AD_NOTI(x_id_notificacion IN NUMBER,x_contenido IN XMLTYPE, x_id_jornada_notificaciones IN NUMBER, x_identificacion_medicos IN NUMBER, x_id_resultado IN NUMBER, x_id_jefe IN NUMBER, x_id_paciente IN NUMBER);
    FUNCTION CO_NOTI RETURN SYS_REFCURSOR;
END PA_SECRETARIO;
/