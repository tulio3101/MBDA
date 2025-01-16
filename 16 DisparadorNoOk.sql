/*El numero de consultorio se genera automaticamente */
INSERT INTO Medicos VALUES ('Pablo','Perez',605,'P2blo@gmail.com',null,'Inactivo',null);
/* Solo se puede modificar el estado y el telefono no eliminar ni insertar */
INSERT INTO Medicos VALUES ('Pablo','Perez',613,'P2bl6@gmail.com',315222,'Activo',600);
UPDATE Medicos SET nombre = 'Picasso' WHERE identificacion = 613;
SELECT * FROM Medicos WHERE identificacion = 613;
/*Si al recetar medicamentos es nulo se asume que el paciente no necesita */
INSERT INTO Medicamentos VALUES ('Paracetamol',605,-11);
/*Solo se puede modificar el tratamiento de historias clinicas*/
INSERT INTO Pacientes VALUES ('Rosi','Sisi',1100,'R100@123','Efectivo','CasaR');
INSERT INTO Entidades VALUES ('salu11112','111l@salud');
INSERT INTO HistoriasClinicas VALUES (597,1100,'salu11112',TO_DATE('2026-01-10', 'YYYY-MM-DD'),'Malestar general','Tomarse un dolex','1 cada 8 horas',SYSDATE);
UPDATE HistoriasClinicas SET fechaConsulta = SYSDATE WHERE historia_id = 597;
/*Solamente se puede eliminar un tratamiento tal que la fecha sea anterior al 31 de enero de 2024*/
INSERT INTO Pacientes VALUES ('Juan','Cortes',284,'J84n@123','Efectivo','Universidad');
INSERT INTO Entidades VALUES ('salud216','salud216@');
INSERT INTO HistoriasClinicas VALUES (563,284,'salud216',TO_DATE('2025-01-10', 'YYYY-MM-DD'),'Malestar general','Tomarse un dolex','1 cada 8 horas',SYSDATE);
DELETE FROM HistoriasClinicas WHERE historia_id = 563;
/*Si no hay motivo de cita medica, se asume que es general*/
INSERT INTO Pacientes VALUES ('Bob','Patino',517, '1bobb@gmail.com', 'Efectivo', 'Bogota');
INSERT INTO Medicos VALUES ('Dino','Gonzales',1044,'dinooo@gmail.com',null,'Activo',5556);
INSERT INTO Pagos VALUES (515, 517, TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 100,'Transf','Pagado','Observacion');
INSERT INTO Citas VALUES(25999,517,SYSDATE,'Urgencias','Cumplida','Malestar',1044,515);
/*Si la fecha actual es menor a la hora de la cita y el estado es cumplida el paciente asistio a la cita medica*/
INSERT INTO Pacientes VALUES ('Juan','Pombo',9990, '12annnn@gmail.com', 'Tarjeta', 'Campin');
INSERT INTO Medicos VALUES ('Dino','Gonzales',1045,'din1oo@gmail.com',null,'Activo',5556);
INSERT INTO Pagos VALUES (517, 9990, TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 100,'Transf','Pagado','Observacion');
INSERT INTO Citas VALUES(2022,9990,TO_DATE('2024-05-10', 'YYYY-MM-DD'),'Dolor de Cabeza','Cumplida','El paciente presenta un dolor de cabeza muy fuerte en la division clavicular',1045,517);
/*De los pacientes solo se puede modificar el metodo de pago y la residencia */
INSERT INTO Pacientes VALUES ('Maestro','Sanabria',12323,'M932@gmail.com','Tarjeta','Universidad');
UPDATE Pacientes SET nombre = 'Maestro' WHERE id = 12323;