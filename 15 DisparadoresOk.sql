/* El numero de consultorio se genera automaticamente */
INSERT INTO Medicos VALUES ('Pablo','Perez',600,'Pablo@gmail.com',315222,'Activo',600);
SELECT * FROM Medicos WHERE nombre = 'Pablo';
/* Solo se puede modificar el estado y el telefono no eliminar ni insertar */
INSERT INTO Medicos VALUES ('Pablo','Perez',612,'Pabl6@gmail.com',315222,'Activo',600);
UPDATE Medicos SET telefono = 123 WHERE identificacion = 612;
SELECT * FROM Medicos WHERE identificacion = 612;
/*Si al recetar medicamentos es nulo se asume que el paciente no necesita */
INSERT INTO Medicamentos VALUES ('Paracetamo2',612,1);
/*Solo se puede modificar el tratamiento de historias clinicas*/
INSERT INTO Pacientes VALUES ('Juan','Cortes',261,'J23n@123','Efectivo','Universidad');
INSERT INTO Entidades VALUES ('salud202','salud202@');
INSERT INTO HistoriasClinicas VALUES (589,261,'salud202',TO_DATE('2025-01-11', 'YYYY-MM-DD'),'Malestar general','Tomarse un dolex','1 cada 8 horas',SYSDATE);
UPDATE HistoriasClinicas SET tratamiento = 'prueba' WHERE historia_id = 589;
SELECT * FROM HistoriasClinicas WHERE historia_id = 589;
/*Solamente se puede eliminar un tratamiento tal que la fecha sea anterior al 31 de enero de 2024*/
INSERT INTO Pacientes VALUES ('Juan','Cortes',277,'J77n@123','Efectivo','Universidad');
INSERT INTO Entidades VALUES ('salud277','salud277@');
INSERT INTO HistoriasClinicas VALUES (565,277,'salud277',TO_DATE('2023-02-01', 'YYYY-MM-DD'),'Malestar general','Tomarse un dolex','1 cada 8 horas',SYSDATE);
DELETE FROM HistoriasClinicas WHERE historia_id = 565;
/*Si no hay motivo de cita medica se asume que es general*/
INSERT INTO Pacientes VALUES ('JULIAN','lOPEZ',519, 'j19ls@gmail.com', 'Tarjeta', 'SOPO');
INSERT INTO Medicos VALUES ('Cbum','Gonzo',999,'m1olympia@gmail.com',null,'Activo',5555);
INSERT INTO Pagos VALUES (513, 519, TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 100,'Transf','Pagado','Observacion');
INSERT INTO Citas VALUES(289,519,SYSDATE,NULL,'Cumplida','Malestar',999,513);
SELECT * FROM CITAS WHERE cita_id = 289;
/*Si la fecha actual es menor a la  hora de la cita y el estado es cumplida el paciente asistio a la cita medica*/
INSERT INTO Pacientes VALUES ('Charlie','Barrero',514, 'barre4ro@gmail.com', 'Tarjeta', 'Escuela Militar');
INSERT INTO Medicos VALUES ('Arnold','RasHomo',500,'hola1@gmail.com',null,'Activo',9999);
INSERT INTO Pagos VALUES (514, 514, TO_DATE('2025-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 100,'Transf','Pagado','Observacion');
INSERT INTO Citas VALUES(2333,514,TO_DATE('2025-12-12', 'YYYY-MM-DD'),'Vomito','Cumplida','Vomito Cronico',500,514);
SELECT * FROM Citas WHERE cita_id = 2333;
/*De los pacientes solo se puede modificar el metodo de pago y la residencia */
INSERT INTO Pacientes VALUES ('Diego','Ortiz',490,'Diego90ni@gmail.com','Efectivo','Choconta');
UPDATE Pacientes SET metodosDePago = 'Tarjeta' WHERE id = 490;
SELECT * FROM Pacientes WHERE id = 490;