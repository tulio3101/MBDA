/*AD_MEDICOS*/
EXECUTE PC_MEDICOS.AD_MEDICOS('PEPI', 'XX', 100002, 'pep1t4@mail.com', 3162324356, 'Activo', 2000);
SELECT * FROM Medicos WHERE identificacion = 100002;
/*MO_MEDICOS*/
EXECUTE PC_MEDICOS.MO_MEDICOS('PEPI','XX',100002,'pep1t4@mail.com',1111,'Activo',2000);
SELECT * FROM Medicos WHERE identificacion = 100002;
/*DEL_MEDICOS*/
EXECUTE PC_Medicos.DEL_MEDICOS(100002);
SELECT * FROM Medicos WHERE identificacion = 100002;
/*AD_HISTORIAS_CLINICAS*/
INSERT INTO Pacientes VALUES ('Carlos', 'Perez', 1146, '1146@ex.com', 'Tarjeta', 'Madrid');
INSERT INTO Entidades VALUES ('entidad_12', 'enti_12@co7ntry.com');
EXECUTE PC_HISTORIAS_CLINICAS.AD_HISTORIAS_CLINICAS(2021,1146,'entidad_12',TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Gastritis', 'Med A', SYSDATE);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2021;
/*MO_HISTORIAS_CLINICAS*/
EXECUTE PC_HISTORIAS_CLINICAS.MO_HISTORIAS_CLINICAS(2021,1146,'entidad_12',TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Hola', 'Med A', SYSDATE);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2021;
/*DEL_HISTORIAS_CLINICAS*/
EXECUTE PC_Historias_Clinicas.DEL_Historias_Clinicas(2021);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2021;
/*AD_MEDICAMENTOS*/
EXECUTE INSERT INTO Medicamentos (nombre, id, unidades) VALUES ('prueba_1',9991,5);
SELECT * FROM Medicamentos WHERE id = 9991;
/*CO_MEDICAMENTOS*/
SET SERVEROUTPUT ON;
DECLARE
    cursor_medicamentos SYS_REFCURSOR;
BEGIN
    cursor_medicamentos := PC_MEDICAMENTOS.CO_MEDICAMENTOS();
    DBMS_SQL.RETURN_RESULT(cursor_medicamentos);
END;

/*CO_MEDICAMENTO_HOSPITAL*/
DECLARE
    cursor_medicamentos_hospital SYS_REFCURSOR;
BEGIN
    cursor_medicamentos_hospital := PC_MEDICAMENTOS.CO_MEDICAMENTO_HOSPITAL();
    DBMS_SQL.RETURN_RESULT(cursor_medicamentos_hospital);
END;

/*AD_PACIENTES*/
EXECUTE PC_PACIENTES.AD_PACIENTES('Carlos', 'Perez', 1003, 'Charlie@1x.com', 'Tarjeta', 'Cajica');
SELECT * FROM Pacientes WHERE id = 1003;
/*MO_PACIENTES*/
EXECUTE PC_PACIENTES.MO_PACIENTES(1003,'Efectivo','Bogota');
SELECT * FROM Pacientes WHERE id = 1003;
/*DEL_PACIENTES*/
EXECUTE PC_PACIENTES.DEL_PACIENTES(1003);
SELECT * FROM Pacientes WHERE id = 1003;

/*CO_PACIENTES_CITAS*/
DECLARE
    cursor_pacientes_citas SYS_REFCURSOR;
BEGIN
    cursor_pacientes_citas := PC_PACIENTES.CO_PACIENTES_CITAS();
    DBMS_SQL.RETURN_RESULT(cursor_pacientes_citas);
END;
/*CO_PACIENTES_TIENE_PACIENTES*/
DECLARE
    cursor_pacientes_tiene_pacientes SYS_REFCURSOR;
BEGIN
    cursor_pacientes_tiene_pacientes := PC_PACIENTES.CO_PACIENTES_TIENE_PACIENTES();
    DBMS_SQL.RETURN_RESULT(cursor_pacientes_tiene_pacientes);
END;
/*CO_PACIENTES_CITA_FECHA*/
DECLARE 
    cursor_pacientes_cita_fecha SYS_REFCURSOR;
BEGIN
    cursor_pacientes_cita_fecha := PC_PACIENTES.CO_PACIENTES_CITA_FECHA();
    DBMS_SQL.RETURN_RESULT(cursor_pacientes_cita_fecha);
END;
/*CO_PACIENTES_PAGO*/
DECLARE
    cursor_pacientes_pago SYS_REFCURSOR;
BEGIN
    cursor_pacientes_pago := PC_PACIENTES.CO_PACIENTES_PAGO();
    DBMS_SQL.RETURN_RESULT(cursor_pacientes_pago);
END;
/*AD_CITAS*/
EXECUTE PC_MEDICOS.AD_MEDICOS('Paco','Alcazar',10001,'9991@gmail.com',316232,'Activo',2000);
EXECUTE PC_PACIENTES.AD_PACIENTES ('Carlos', 'Perez', 1790, '790@1x.com', 'Tarjeta', 'Cajica');
INSERT INTO Pagos VALUES (519, 1790, TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 100,'Transf','Pagado','Observacion');
EXECUTE PC_CITAS.AD_CITAS(10002, 1790, SYSDATE, 'Cumplida', 'Cumplida', 'Cumplida', 10001, 519);
SELECT * FROM Citas WHERE cita_id = 10002;
/*CO_CITAS*/
SET SERVEROUTPUT ON;

DECLARE
    cursor_citas_1 SYS_REFCURSOR;
BEGIN
    cursor_citas_1 := PC_CITAS.CO_CITAS();
    DBMS_SQL.RETURN_RESULT(cursor_citas_1);
END;