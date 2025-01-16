/*Medicos*/
CREATE OR REPLACE PACKAGE BODY PC_MEDICOS IS 
    PROCEDURE AD_MEDICOS(x_nombre IN VARCHAR ,x_apellido IN VARCHAR,x_identificacion IN NUMBER,x_correo IN VARCHAR,x_telefono IN NUMBER,x_estado IN VARCHAR,x_numero_consultorio IN NUMBER) IS 
    BEGIN 
        INSERT INTO Medicos(nombre,apellido,identificacion,correo,telefono,estado,numero_consultorio) VALUES (x_nombre,x_apellido,x_identificacion,x_correo,x_telefono,x_estado,x_numero_consultorio);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20111, 'Error al insertar en Medicos');
    END;

   PROCEDURE MO_MEDICOS(x_nombre IN VARCHAR ,x_apellido IN VARCHAR,x_identificacion IN NUMBER,x_correo IN VARCHAR,x_telefono IN NUMBER,x_estado IN VARCHAR,x_numero_consultorio IN NUMBER) IS
   BEGIN
        UPDATE Medicos SET  telefono = x_telefono,estado = x_estado WHERE identificacion = x_identificacion AND nombre = x_nombre;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20112, 'Error al modificar Medicos');
    END;

    PROCEDURE DEL_MEDICOS(x_identificacion IN NUMBER) IS
    BEGIN
        DELETE FROM Medicos
        WHERE identificacion = x_identificacion;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20113, 'Error al eliminar en medicos');
    END;
    
    FUNCTION CO_ESPECIALISTAS RETURN SYS_REFCURSOR IS
        cursor_especialistas SYS_REFCURSOR;
    BEGIN
        OPEN cursor_especialistas FOR
            SELECT COUNT(identificacion_especialistas) AS Especializados
            FROM Especialistas;
        RETURN cursor_especialistas;
    END CO_ESPECIALISTAS;

END PC_MEDICOS;
/
/*Historias Clinicas*/
CREATE OR REPLACE PACKAGE BODY PC_HISTORIAS_CLINICAS IS
    PROCEDURE AD_HISTORIAS_CLINICAS(x_historia_id IN NUMBER, x_paciente_id IN NUMBER,x_nombre_entidad IN VARCHAR,x_fechaConsulta IN DATE, x_motivoConsulta IN VARCHAR, x_diagnostico IN VARCHAR, x_tratamiento IN VARCHAR, x_fecha IN DATE) IS
    BEGIN 
        INSERT INTO HistoriasClinicas(historia_id,paciente_id,nombre_entidad,fechaConsulta,motivoConsulta,diagnostico,tratamiento,fecha) VALUES (x_historia_id,x_paciente_id,x_nombre_entidad,x_fechaConsulta,x_motivoConsulta,x_diagnostico,x_tratamiento,x_fecha);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20111, 'Error al insertar en Historias Clinicas');
    END;
    
    PROCEDURE MO_HISTORIAS_CLINICAS(x_historia_id IN NUMBER, x_paciente_id IN NUMBER,x_nombre_entidad IN VARCHAR,x_fechaConsulta IN DATE, x_motivoConsulta IN VARCHAR, x_diagnostico IN VARCHAR, x_tratamiento IN VARCHAR, x_fecha IN DATE) IS
    BEGIN
        UPDATE HistoriasClinicas SET tratamiento = x_tratamiento WHERE historia_id = x_historia_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20112, 'Error al modificar HistoriasClinicas');
    END;
    
    PROCEDURE DEL_HISTORIAS_CLINICAS(x_historia_id IN NUMBER) IS
    BEGIN
        DELETE FROM HistoriasClinicas
        WHERE historia_id = x_historia_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20113, 'Error al eliminar en Historias Clinicas');
    END;
    
END PC_HISTORIAS_CLINICAS;
/
/*Medicamentos*/
CREATE OR REPLACE PACKAGE BODY PC_MEDICAMENTOS IS
    PROCEDURE AD_MEDICAMENTOS(x_nombre IN VARCHAR, x_id IN NUMBER, x_unidades IN NUMBER) IS
    BEGIN 
        INSERT INTO Medicamentos(nombre, id, unidades) VALUES (x_nombre, x_id, x_unidades);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20114, 'Error al insertar en medicamentos');
    END AD_MEDICAMENTOS;

    FUNCTION CO_MEDICAMENTOS RETURN SYS_REFCURSOR IS 
        cursor_medicamentos SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_medicamentos FOR 
            SELECT Medicamentos.id, Medicamentos.Unidades, Pacientes.nombre 
            FROM Medicamentos
            JOIN PideMedicamentos ON Medicamentos.id = PideMedicamentos.id_Medicamentos
            JOIN Pacientes ON PideMedicamentos.id_Paciente = Pacientes.id
            ORDER BY Medicamentos.id DESC;
        RETURN cursor_medicamentos;
    END CO_MEDICAMENTOS;
    
    FUNCTION CO_MEDICAMENTO_HOSPITAL RETURN SYS_REFCURSOR IS
        cursor_medicamentos_hospital SYS_REFCURSOR;
    BEGIN
        OPEN cursor_medicamentos_hospital FOR
            SELECT nombre, unidades FROM Medicamentos;
        RETURN cursor_medicamentos_hospital;
    END CO_MEDICAMENTO_HOSPITAL;
    
END PC_MEDICAMENTOS;
/
/*Pacientes*/
CREATE OR REPLACE PACKAGE BODY PC_PACIENTES IS
    PROCEDURE AD_PACIENTES(x_nombre IN VARCHAR,x_apellido IN VARCHAR,x_id IN NUMBER,x_correo IN VARCHAR,x_metodosDePago IN VARCHAR,x_residencia IN VARCHAR) IS
    BEGIN 
        INSERT INTO Pacientes(nombre,apellido,id,correo,metodosDePago,residencia) VALUES (x_nombre,x_apellido,x_id,x_correo,x_metodosDePago,x_residencia);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20111, 'Error al insertar en Pacientes');
    END;
    
    PROCEDURE MO_PACIENTES(x_id IN NUMBER, x_metodosDePago IN VARCHAR,x_residencia IN VARCHAR) IS
    BEGIN
        UPDATE Pacientes SET metodosDePago = x_metodosDePago , residencia = x_residencia WHERE id = x_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20112, 'Error al modificar Pacientes');
    END;
    
    PROCEDURE DEL_PACIENTES(x_id IN NUMBER) IS
    BEGIN
        DELETE FROM Pacientes
        WHERE id = x_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20113, 'Error al eliminar en Pacientes');
    END;
    
    FUNCTION CO_PACIENTES_CITAS RETURN SYS_REFCURSOR IS
        cursor_pacientes_citas SYS_REFCURSOR;
    BEGIN
        OPEN cursor_pacientes_citas FOR
            SELECT COUNT(Pacientes.id) AS Pacientes
            FROM Pacientes JOIN Citas ON (Pacientes.id = Citas.paciente_id)
            JOIN Pagos ON (Pagos.pago_id = Citas.pago_id)
            WHERE Citas.estado = 'Confirmada' AND Pagos.estadoPago = 'Pagado';
            RETURN cursor_pacientes_citas;
    END CO_PACIENTES_CITAS;
    
    FUNCTION CO_PACIENTES_TIENE_PACIENTES RETURN SYS_REFCURSOR IS 
        cursor_pacientes_tiene SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_pacientes_tiene FOR 
            SELECT Pacientes.nombre AS Nombre_Pacientes, Pacientes.id AS Identificacion_Pacientes, nombre_entidad AS Entidad
            FROM Pacientes 
            JOIN TienePacientes ON (Pacientes.id = TienePacientes.paciente_id);
        RETURN cursor_pacientes_tiene;
    END CO_PACIENTES_TIENE_PACIENTES;
    
    FUNCTION CO_PACIENTES_CITA_FECHA RETURN SYS_REFCURSOR IS 
        cursor_pacientes_cita_fecha SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_pacientes_cita_fecha FOR 
            SELECT Pacientes.nombre AS Nombre_Paciente, Citas.cita_id AS Cita_ID, Citas.fechaHora AS Fecha_Hora
            FROM Pacientes JOIN Citas ON (Pacientes.id = Citas.paciente_id)
            ORDER BY fechaHora;
        RETURN cursor_pacientes_cita_fecha;
    END CO_PACIENTES_CITA_FECHA;


    FUNCTION CO_PACIENTES_PAGO RETURN SYS_REFCURSOR IS 
        cursor_pacientes_pago SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_pacientes_pago FOR 
            SELECT COUNT(pago_id) AS CantidadPagos
            FROM Pacientes JOIN Pagos ON (id = paciente_id)
            WHERE estadoPago = 'Pagado';
        RETURN cursor_pacientes_pago;
    END CO_PACIENTES_PAGO;
    
END PC_PACIENTES;
/
/*Citas*/
CREATE OR REPLACE PACKAGE BODY PC_CITAS IS
    PROCEDURE AD_CITAS(x_cita_id IN NUMBER,x_paciente_id IN NUMBER, x_fechaHora IN DATE,x_motivo IN VARCHAR,x_estado IN VARCHAR,x_observaciones IN VARCHAR,x_identificacion IN NUMBER, x_pago_id IN NUMBER)IS
    BEGIN 
        INSERT INTO Citas(cita_id,paciente_id,fechaHora,motivo,estado,observaciones,identificacion, pago_id) VALUES (x_cita_id,x_paciente_id,x_fechaHora,x_motivo,x_estado,x_observaciones,x_identificacion, x_pago_id);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20114, 'Error al insertar en Citas');
    END;

    FUNCTION CO_CITAS RETURN SYS_REFCURSOR IS 
        cursor_citas SYS_REFCURSOR;
    BEGIN 
        OPEN cursor_citas FOR 
            SELECT *
            FROM Citas
            JOIN Pacientes ON Citas.paciente_id = Pacientes.id
            JOIN Medicos ON Citas.identificacion = Medicos.identificacion;
            RETURN cursor_citas;
    END CO_CITAS;
    
END PC_CITAS;
/