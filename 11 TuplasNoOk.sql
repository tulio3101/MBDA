-- Un paciente no puede tener dos citas en la misma fecha y hora
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Juan','Perez',899,'j1an@gmail.com','Efectivo','Bogotá');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Rodri','Gamero',834,'r4driG@gmail.com',310021,'Activo', 777);
INSERT INTO Pagos VALUES (503, 899, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 100.00, 'Tarjeta', 'Pagado', 'N/A');
INSERT INTO Citas(cita_id, paciente_id, fechaHora, motivo, estado, observaciones, identificacion, pago_id) VALUES (756,899,TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'),'General','Sano','Glucosa',834,503);
INSERT INTO Citas(cita_id, paciente_id, fechaHora, motivo, estado, observaciones, identificacion, pago_id) VALUES (066,899,TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'),'General','Sani','Glucosa',834,503);
-- Si el estado de la cita es "Cancelada", el atributo observaciones no puede ser nulo se debería registrar
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Julian','Lopez',7771,'julia7n@gmail.com','Efectivo','Bogotá');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado) VALUES ('Juan','Gaviria',10113211,'Ju1nGA@gmail.com',123,'Activo');
INSERT INTO Pagos VALUES (504, 7771, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 100.00, 'Tarjeta', 'Pagado', 'N/A');
INSERT INTO Citas(cita_id, paciente_id, fechaHora, motivo, estado, observaciones, identificacion, pago_id) VALUES (10000,7771,TO_DATE('2021-04-15 06:00', 'YYYY-MM-DD HH24:MI'),'General','Cancelada',NULL,10113211, 504);
-- Si el estadoPago es Confirmado, el monto debe ser mayor a 0
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Nicolas','Perez',1599,'N1C0P3r3@gmail.com','Efectivo','Bogotá');
INSERT INTO Pagos (pago_id, paciente_id, fechaPago, monto, metodoPago, estadoPago, observaciones) VALUES (99998, 1599, TO_DATE('2023-01-15', 'YYYY-MM-DD'), -100200, 'Tarjeta', 'Pagado', 'N/A');

