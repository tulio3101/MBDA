/*
Al eliminar un Paciente se va a eliminar su historia clinica asociada.
*/
INSERT INTO Pacientes VALUES ('Carlos', 'Perez',69, '1.perez@ex.com', 'Tarjeta', 'Madrid');

INSERT INTO Entidades VALUES ('C4inSalud','p2ueba@');

INSERT INTO HistoriasClinicas VALUES (123, 69, 'C4inSalud', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Dolor abdominal', 'Gastritis', 'Reposo', TO_DATE('2023-01-15', 'YYYY-MM-DD'));

DELETE FROM Pacientes WHERE id = 69;

SELECT * FROM HistoriasClinicas WHERE paciente_id = 69;

/*
Al eliminar un Paciente se eliminaran sus pagos asociados.
*/

INSERT INTO Pacientes VALUES ('Juan', 'Maestro', 73, 'JuanM@gmail.com', 'Tarjeta', 'Sopo');

INSERT INTO Pagos VALUES (512, 73, TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 100,'Transf','Pagado','Observacion');


DELETE FROM Pacientes WHERE id = 73;

SELECT * FROM Pacientes WHERE id = 73;
