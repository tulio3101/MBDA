-- PA_GERENTE
CREATE OR REPLACE PACKAGE PA_GERENTE IS
    PROCEDURE AD_MEDICOS(x_nombre IN VARCHAR ,x_apellido IN VARCHAR,x_identificacion IN NUMBER,x_correo IN VARCHAR,x_telefono IN NUMBER,x_estado IN VARCHAR,x_numero_consultorio IN NUMBER);
    PROCEDURE MO_MEDICOS(x_nombre IN VARCHAR ,x_apellido IN VARCHAR,x_identificacion IN NUMBER,x_correo IN VARCHAR,x_telefono IN NUMBER,x_estado IN VARCHAR,x_numero_consultorio IN NUMBER);
    PROCEDURE DEL_MEDICOS(x_identificacion IN NUMBER);
END PA_GERENTE;
/
-- PA_ADMINISTRATIVOS
CREATE OR REPLACE PACKAGE PA_ADMINISTRATIVOS IS
    PROCEDURE AD_MEDICAMENTOS(x_nombre IN VARCHAR, x_id IN NUMBER, x_unidades IN NUMBER);
    PROCEDURE AD_CITAS(x_cita_id IN NUMBER,x_paciente_id IN NUMBER, x_fechaHora IN DATE,x_motivo IN VARCHAR,x_estado IN VARCHAR,x_observaciones IN VARCHAR,x_identificacion IN NUMBER, x_pago_id IN NUMBER);
    FUNCTION CO_CITAS RETURN SYS_REFCURSOR;
    FUNCTION CO_MEDICAMENTOS RETURN SYS_REFCURSOR;
END PA_ADMINISTRATIVOS;
/
-- PA_MEDICOS
CREATE OR REPLACE PACKAGE PA_MEDICO IS
    PROCEDURE AD_HISTORIAS_CLINICAS(x_historia_id IN NUMBER, x_paciente_id IN NUMBER,x_nombre_entidad IN VARCHAR,x_fechaConsulta IN DATE, x_motivoConsulta IN VARCHAR, x_diagnostico IN VARCHAR, x_tratamiento IN VARCHAR, x_fecha IN DATE);
    PROCEDURE MOD_HISTORIAS_CLINICAS(x_historia_id IN NUMBER, x_paciente_id IN NUMBER,x_nombre_entidad IN VARCHAR,x_fechaConsulta IN DATE, x_motivoConsulta IN VARCHAR, x_diagnostico IN VARCHAR, x_tratamiento IN VARCHAR, x_fecha IN DATE);
    PROCEDURE DEL_HISTORIAS_CLINICAS(x_historia_id IN NUMBER);
    PROCEDURE AD_PACIENTES(x_nombre IN VARCHAR,x_apellido IN VARCHAR,x_id IN NUMBER,x_correo IN VARCHAR,x_metodosDePago IN VARCHAR,x_residencia IN VARCHAR);
    PROCEDURE MO_PACIENTES(x_id IN NUMBER, x_metodosPago IN VARCHAR,x_residencia IN VARCHAR);
    PROCEDURE DEL_PACIENTES(x_id IN NUMBER);
END PA_MEDICO;
/
