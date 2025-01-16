/*El numero de consultorio se genera automaticamente */
DROP SEQUENCE customers_seq;
CREATE SEQUENCE customers_seq
 START WITH     200
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
CREATE OR REPLACE TRIGGER TG_Consultorio
BEFORE INSERT ON Medicos
FOR EACH ROW
DECLARE
consultorios NUMBER;
BEGIN
    IF :NEW.estado = 'Activo' AND :NEW.numero_consultorio IS NOT NULL THEN
        SELECT customers_seq.NEXTVAL INTO consultorios FROM dual;
        :NEW.numero_consultorio := consultorios;
    ELSIF :NEW.estado = 'Inactivo' AND :NEW.numero_consultorio IS NULL THEN
        RAISE_APPLICATION_ERROR(-20003, 'No existe medico asociado porque esta inactivo');
    END IF;
 END;
/
/* Solo se puede modificar el estado y el telefono no eliminar ni insertar */
CREATE OR REPLACE TRIGGER TG_MODIFICAR_MEDICOS
BEFORE UPDATE OF nombre, apellido, correo, identificacion, numero_consultorio ON Medicos
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'Solo se puede modificar estado y telefono');
END;
/
/*Si al recetar medicamentos es nulo se asume que el paciente no necesita */
CREATE OR REPLACE TRIGGER TG_MEDICAMENTOS
BEFORE INSERT ON Medicamentos
FOR EACH ROW
BEGIN
    IF :NEW.unidades > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Se han recetado medicamentos');
    ELSIF :NEW.unidades = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El paciente no necesita medicamentos');
    ELSIF :NEW.unidades < 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'No hay medicamentos disponibles');
    END IF;
END;
/
/*De las historias clinicas solo se puede modificar el tratamiento*/
CREATE OR REPLACE TRIGGER TG_HISTORIAS_CLINICAS_MODIFICAR
BEFORE UPDATE OF historia_id,paciente_id ,nombre_entidad ,fechaConsulta ,motivoConsulta,diagnostico,fecha ON HistoriasClinicas
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'Solo se puede modificar el tratamiento');
END;
/
/*Solamente se puede eliminar un tratamiento tal que la fecha sea anterior al 31 de enero de 2024*/
CREATE OR REPLACE TRIGGER TG_HISTORIAS_CLINICAS_ELIMINAR
BEFORE DELETE ON HistoriasClinicas
FOR EACH ROW
BEGIN
    IF :OLD.fechaConsulta > TO_DATE('2024-01-31', 'YYYY-MM-DD') THEN
        RAISE_APPLICATION_ERROR(-20004,'Solamente se pueden eliminar historias clinicas de pacientes que hayan terminado el tratamiento fechas anteriores al 31 de enero de 2024');
    END IF;
END;
/
/* Si no hay motivo de cita medica, se asume que es general */
CREATE OR REPLACE TRIGGER TG_TIPOS_CITAS
BEFORE INSERT ON Citas
FOR EACH ROW
BEGIN
    IF :NEW.motivo IS NULL THEN
        :NEW.motivo := 'General';
    END IF;
    /* Si el motivo es 'General' y el especialista tiene una especialidad asignada, lanzar error */
    IF :NEW.motivo = 'Urgencias' THEN
        RAISE_APPLICATION_ERROR(-20006, 'Esta seccion del hospital no acepta urgencias');
    END IF;
END;
/
/*Si la fecha actual es menor a la  hora de la cita y el estado es cumplida el paciente asistio a la cita medica*/
CREATE OR REPLACE TRIGGER TG_ASISTENCIA_CITA
BEFORE INSERT ON Citas
FOR EACH ROW
BEGIN
    IF SYSDATE <= :NEW.fechaHora and :New.estado = 'Cumplida' THEN
        DBMS_OUTPUT.PUT_LINE('El paciente asistio a la cita');
    ELSE
        RAISE_APPLICATION_ERROR(-20007, 'El paciente no ha asistido a la cita');
    END IF;
END;
/
/*De los pacientes solo se puede modificar el metodo de pago y la residencia */
CREATE OR REPLACE TRIGGER TG_PACIENTES_MODIFICAR
BEFORE UPDATE OF nombre, apellido, id, correo ON Pacientes
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20008, 'Solo se puede modificar el metodo de pago y la residencia');
END;
/