-- Un paciente no puede tener dos citas en la misma fecha y hora
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Juan','Perez',9960,'juan@gmail.com','Efectivo','Bogotá');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Rodri','Gamero',4340,'ro4driG@gmail.com',310021,'Activo',10000);
INSERT INTO Pagos VALUES (580, 9960, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 100.00, 'Tarjeta', 'Pagado', 'N/A');
INSERT INTO Citas(cita_id, paciente_id, fechaHora, motivo, estado, observaciones, identificacion,pago_id) VALUES (668,9960,TO_DATE('2025-06-20 06:00', 'YYYY-MM-DD HH24:MI'),'General','Cumplida','Glucosa',4340, 580);

SELECT * FROM Citas WHERE cita_id = 668;

-- Si el estado de la cita es "Cancelada", el atributo observaciones no puede ser nulo se debería registrar
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Julian','Lopez',4500,'julia4n@gmail.com','Efectivo','Bogotá');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Juan','Gaviria',4501,'JuanG4@gmail.com',123,'Activo', 10000);
INSERT INTO Pagos VALUES (507, 4500, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 100.00, 'Tarjeta', 'Pagado', 'N/A');
INSERT INTO Citas(cita_id, paciente_id, fechaHora, motivo, estado, observaciones, identificacion, pago_id) VALUES (1200,4500,TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'),'General','Cancelada','Reprogramada',4501,507);

SELECT * FROM Citas WHERE cita_id = 1200;

-- Si el estadoPago es Pagado, el monto debe ser mayor a 0
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Juan','Perez',1500,'8u12@gmail.com','Efectivo','Bogotá');
INSERT INTO Pagos (pago_id, paciente_id, fechaPago, monto, metodoPago, estadoPago, observaciones) VALUES (99999, 1500, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 100200, 'Tarjeta', 'Pagado', 'N/A');

SELECT * FROM Pagos WHERE pago_id = 99999;