/*PA_GERENTE*/
CREATE OR REPLACE PACKAGE BODY PA_GERENTE IS
    PROCEDURE AD_MEDICOS(x_nombre IN VARCHAR ,x_apellido IN VARCHAR,x_identificacion IN NUMBER,x_correo IN VARCHAR,x_telefono IN NUMBER,x_estado IN VARCHAR,x_numero_consultorio IN NUMBER) IS
        BEGIN 
        PC_MEDICOS.AD_MEDICOS(x_nombre,x_apellido,x_identificacion,x_correo,x_telefono,x_estado,x_numero_consultorio);
        END;
    PROCEDURE MO_MEDICOS(x_nombre IN VARCHAR ,x_apellido IN VARCHAR,x_identificacion IN NUMBER,x_correo IN VARCHAR,x_telefono IN NUMBER,x_estado IN VARCHAR,x_numero_consultorio IN NUMBER) IS
        BEGIN 
        PC_MEDICOS.MO_MEDICOS(x_nombre,x_apellido,x_identificacion,x_correo,x_telefono,x_estado,x_numero_consultorio);   
        END;
    PROCEDURE DEL_MEDICOS(x_identificacion IN NUMBER) IS
        BEGIN 
        PC_MEDICOS.DEL_MEDICOS(x_identificacion);
        END;
END PA_GERENTE;
/
/*PA_ADMINISTRATIVO*/
CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRATIVOS IS
    PROCEDURE AD_MEDICAMENTOS(x_nombre IN VARCHAR, x_id IN NUMBER, x_unidades IN NUMBER) IS
        BEGIN
        PC_MEDICAMENTOS.AD_MEDICAMENTOS(x_nombre,x_id,x_unidades);
        END;

    FUNCTION CO_MEDICAMENTOS RETURN SYS_REFCURSOR IS CO_MEDI SYS_REFCURSOR;
    BEGIN
        CO_MEDI := PC_MEDICAMENTOS.CO_MEDICAMENTOS;
        RETURN CO_MEDI;
    END;

    PROCEDURE AD_CITAS(x_cita_id IN NUMBER,x_paciente_id IN NUMBER, x_fechaHora IN DATE,x_motivo IN VARCHAR,x_estado IN VARCHAR,x_observaciones IN VARCHAR,x_identificacion IN NUMBER, x_pago_id IN NUMBER) IS
        BEGIN
        PC_CITAS.AD_CITAS(x_cita_id, x_paciente_id, x_fechahora, x_motivo, x_estado, x_observaciones, x_identificacion, x_pago_id);
    END;
    FUNCTION CO_CITAS RETURN SYS_REFCURSOR IS CO_CIT SYS_REFCURSOR;
    BEGIN
        CO_CIT := PC_CITAS.CO_CITAS;
        RETURN CO_CIT;
    END;
END PA_ADMINISTRATIVOS;
/
/*PA_MEDICO*/
CREATE OR REPLACE PACKAGE BODY PA_MEDICO IS 
    PROCEDURE AD_HISTORIAS_CLINICAS(x_historia_id IN NUMBER, x_paciente_id IN NUMBER,x_nombre_entidad IN VARCHAR,x_fechaConsulta IN DATE, x_motivoConsulta IN VARCHAR, x_diagnostico IN VARCHAR, x_tratamiento IN VARCHAR, x_fecha IN DATE) IS
        BEGIN
        PC_HISTORIAS_CLINICAS.AD_HISTORIAS_CLINICAS(x_historia_id, x_paciente_id,x_nombre_entidad,x_fechaConsulta, x_motivoConsulta, x_diagnostico, x_tratamiento, x_fecha);
        END;
    PROCEDURE MOD_HISTORIAS_CLINICAS(x_historia_id IN NUMBER, x_paciente_id IN NUMBER,x_nombre_entidad IN VARCHAR,x_fechaConsulta IN DATE, x_motivoConsulta IN VARCHAR, x_diagnostico IN VARCHAR, x_tratamiento IN VARCHAR, x_fecha IN DATE) IS
        BEGIN
        PC_HISTORIAS_CLINICAS.MO_HISTORIAS_CLINICAS(x_historia_id, x_paciente_id, x_nombre_entidad,x_fechaConsulta, x_motivoConsulta, x_diagnostico, x_tratamiento, x_fecha);
        END;
    PROCEDURE DEL_HISTORIAS_CLINICAS(x_historia_id IN NUMBER) IS
        BEGIN
        PC_HISTORIAS_CLINICAS.DEL_HISTORIAS_CLINICAS(x_historia_id);
        END;
    PROCEDURE AD_PACIENTES(x_nombre IN VARCHAR,x_apellido IN VARCHAR,x_id IN NUMBER,x_correo IN VARCHAR,x_metodosDePago IN VARCHAR,x_residencia IN VARCHAR) IS
        BEGIN
        PC_PACIENTES.AD_PACIENTES(x_nombre,x_apellido,x_id,x_correo,x_metodosDePago,x_residencia);
        END;
    PROCEDURE MO_PACIENTES(x_id IN NUMBER,x_metodosPago IN VARCHAR,x_residencia IN VARCHAR) IS
        BEGIN
        PC_PACIENTES.MO_PACIENTES(x_id,x_metodosPago,x_residencia);
        END;
    PROCEDURE DEL_PACIENTES(x_id IN NUMBER) IS
    BEGIN
        PC_PACIENTES.DEL_PACIENTES(x_id);
        END;
END PA_MEDICO;
/