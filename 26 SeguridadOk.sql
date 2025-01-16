/*Seguridad OK*/
/*Gerente*/
EXECUTE PA_GERENTE.AD_MEDICOS('Juan','Garzon',100009,'JuanG@mail.com',3162324356,'Activo',2001);

SELECT * FROM Medicos WHERE identificacion = 100009;

EXECUTE PA_GERENTE.MO_MEDICOS('Juan','Garzon',100009,'JuanG@mail.com',987654,'Activo',2001);

SELECT * FROM Medicos WHERE identificacion = 100009;

EXECUTE PA_GERENTE.DEL_MEDICOS(100009);

SELECT * FROM Medicos WHERE identificacion = 100009;
-- No se selecciona ninguna fila, porque se elimina el medico
/*Administrativos*/
EXECUTE PA_ADMINISTRATIVOS.AD_MEDICAMENTOS('prueba_2',9992,6);
SELECT * FROM Medicamentos WHERE nombre = 'prueba_2';

INSERT INTO Medicos (nombre,apellido,identificacion,correo,telefono,estado,numero_consultorio) VALUES ('Tulio','Riaño',10010,'Tuuuulio@gil.com',316232,'Activo',2000);
INSERT INTO Pacientes VALUES ('Carlos', 'Perez', 1799, '791@1x.com', 'Tarjeta', 'Cajica');
INSERT INTO Pagos VALUES (521, 1799, TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 100,'Transf','Pagado','Observacion');

EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(10010, 1799, SYSDATE, 'Cumplida', 'Cumplida', 'Cumplida', 10001, 521);
SELECT * FROM Medicos WHERE identificacion = 10001;
SELECT * FROM Citas WHERE  Cita_id = 10010;

DECLARE
    cursor_pa_administrativos SYS_REFCURSOR;
BEGIN
    cursor_pa_administrativos := PA_ADMINISTRATIVOS.CO_CITAS();
    DBMS_SQL.RETURN_RESULT(cursor_pa_administrativos);
END;

DECLARE
    cursor_pa_administrativos_medicamentos SYS_REFCURSOR;
BEGIN
    cursor_pa_administrativos_medicamentos := PA_ADMINISTRATIVOS.CO_MEDICAMENTOS();
    DBMS_SQL.RETURN_RESULT(cursor_pa_administrativos_medicamentos);
END;

/*Medicos*/
INSERT INTO Pacientes VALUES ('Nestor', 'Perez', 1148, '1148@ex.com', 'Tarjeta', 'Madrid');
INSERT INTO Entidades VALUES ('entidad_14', 'enti_14@co7ntry.com');
EXECUTE PA_MEDICO.AD_HISTORIAS_CLINICAS(2024,1148,'entidad_14',TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Gastritis', 'Med A', SYSDATE);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2024;
EXECUTE PA_MEDICO.MOD_HISTORIAS_CLINICAS(2024,1148,'entidad_14',TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Prueba', 'Med A', SYSDATE);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2024;
EXECUTE PA_MEDICO.DEL_HISTORIAS_CLINICAS(2024);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2024;

EXECUTE PA_MEDICO.AD_PACIENTES('Juan','Perez',1150, '1150@ex.com', 'Tarjeta', 'Villa');
SELECT * FROM Pacientes WHERE id = 1150;
EXECUTE PA_MEDICO.MO_PACIENTES(1150,'Efectivo','Bogota');
SELECT * FROM Pacientes WHERE id = 1150;
EXECUTE PA_MEDICO.DEL_PACIENTES(1150);
SELECT * FROM Pacientes WHERE id = 1150;