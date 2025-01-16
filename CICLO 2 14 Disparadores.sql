-- Mantener Jefes Laboratorio
-- Adicionar
DROP SEQUENCE jefe_id;
CREATE SEQUENCE jefe_id
 START WITH     100
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
CREATE OR REPLACE TRIGGER TG_INSERTAR_JEFE_LABORATORIO
BEFORE INSERT ON JefesLaboratorio
FOR EACH ROW
DECLARE
identificacion_jefe NUMBER;
BEGIN 
    SELECT jefe_id.NEXTVAL INTO identificacion_jefe FROM dual;
    :NEW.id_jefe := identificacion_jefe;
END;
-- Modificar
CREATE OR REPLACE TRIGGER TG_TELEFONO
BEFORE UPDATE OF id_jefe,nombre,apellido,correoElectronico,estado ON JefesLaboratorio
FOR EACH ROW
BEGIN 
    RAISE_APPLICATION_ERROR(-20002, 'Solo se puede modificar el telefono de esta tabla');
END;
-- Eliminar
CREATE OR REPLACE TRIGGER TG_ELIMINAR_JEFE_LABORATORIO
BEFORE DELETE ON JefesLaboratorio
FOR EACH ROW
BEGIN
    IF :OLD.estado != 'Inactivo' AND :OLD.estado != 'Suspendido' THEN
        RAISE_APPLICATION_ERROR(-20001,'Solo se puede eliminar un jefe de laboratorio si su estado es inactivo o suspendido');
    END IF;
END;
-- Mantener Laboratorios
DROP SEQUENCE laboratorio_id;
CREATE SEQUENCE laboratorio_id
 START WITH     300
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
-- Adicionar
CREATE OR REPLACE TRIGGER TG_LABORATORIO_ID
BEFORE INSERT ON Laboratorios
FOR EACH ROW
DECLARE
numero_laboratorio NUMBER;
BEGIN
    SELECT laboratorio_id.NEXTVAL INTO numero_laboratorio FROM dual;
    :NEW.id_laboratorio := numero_laboratorio;
END;
-- Modificar
CREATE OR REPLACE TRIGGER TG_MO_LAB
BEFORE UPDATE OF id_laboratorio,nombre,id_jefe ON Laboratorios
BEGIN 
    RAISE_APPLICATION_ERROR(-20003, 'Solo se puede modificar direccion y contacto');   
END;
-- Eliminar
CREATE OR REPLACE TRIGGER TG_DEL_LAB
BEFORE DELETE ON Laboratorios
FOR EACH ROW
BEGIN
    IF :OLD.direccion IS NOT NULL THEN 
        RAISE_APPLICATION_ERROR(-20004, 'Solo se puede eliminar si la direccion es nula');
    END IF;
END;
-- Mantener Jornadas De Vacunacion
-- Adicionar
CREATE OR REPLACE TRIGGER TG_AD_JORNADA
BEFORE INSERT ON JornadasDeVacunacion
FOR EACH ROW
BEGIN 
    IF :NEW.fecha IS NULL AND :NEW.lugar IS NULL THEN 
        RAISE_APPLICATION_ERROR(-20005, 'Solamente se puede insertar una jornada de vacunación si su fecha y lugar no son nulos.');
    END IF;
END;
-- Modificar
CREATE OR REPLACE TRIGGER TG_MO_TIPOVACUNA
BEFORE UPDATE OF id_jornada,fecha,lugar,cantidadVacunasDisponibles ON JornadasDeVacunacion
BEGIN 
    RAISE_APPLICATION_ERROR(-20006, 'Solo se puede modificar el tipo de vacuna');   
END;
-- Eliminar
CREATE OR REPLACE TRIGGER TG_DEL_JORNADA
BEFORE DELETE ON JornadasDeVacunacion
FOR EACH ROW
BEGIN
    IF :OLD.cantidadVacunasDisponibles > 0 THEN
        RAISE_APPLICATION_ERROR(-20007, 'Solo se puede eliminar si no hay vacunas disponibles');
    END IF;
END;

-- Mantener Pruebas De Laboratorio
-- Adicionar
CREATE OR REPLACE TRIGGER TG_AD_PRUEBA
BEFORE INSERT ON PruebaDeLaboratorio
FOR EACH ROW
BEGIN 
    IF :NEW.resultadoPrevio IS NULL THEN 
        :NEW.resultadoPrevio := 'No se ha entregado la prueba.';
    END IF;
END;
-- Modificar
CREATE OR REPLACE TRIGGER TG_MO_PRUEBA
BEFORE UPDATE OF id_prueba,tipoDePrueba,fecha_realizacion,resultadoPrevio,id_diagnostico ON PruebaDeLaboratorio
BEGIN 
    RAISE_APPLICATION_ERROR(-20002, 'Solo se puede modificar el estado de la prueba');   
END;
-- Eliminar
CREATE OR REPLACE TRIGGER TG_DEL_PRUEBA
BEFORE DELETE ON PruebaDeLaboratorio
FOR EACH ROW
BEGIN
    IF :OLD.estado != 'Completada' AND :OLD.fecha_realizacion <= SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20002, 'Solo se puede eliminar si el estado de la prueba es completada y su fecha es mayor a la fecha actual');
    END IF;
END;