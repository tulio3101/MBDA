-- Intento de insertar un texto en la columna 'id', que espera un número.
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Carlos', 'Perez', 'textoEnId', 'c.perez@ex.com', 'Tarjeta', 'Madrid');
-- Intento de insertar un paciente con un 'id' duplicado.
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Ana', 'Garcia', 1, 'a.garcia@ex.com', 'Transfer', 'Barcelona');
-- Intento de insertar una entidad con un 'correo' duplicado.
INSERT INTO Entidades (nombre, correo) VALUES ('ClinCentro', 'contac@hospcentral.com');
-- Intento de insertar un pago con un 'paciente_id' que no existe en la tabla Pacientes.
INSERT INTO Pagos (pago_id, historia_id, paciente_id, fechaPago, monto, metodoPago, estadoPago, observaciones) VALUES (10, 1, 999, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 200.00, 'Tarjeta', 'Pagado', 'Paciente inexistente');
-- Intento de insertar un paciente con 'nombre' nulo.
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES (NULL, 'Martinez', 2, 'm.martinez@ex.com', 'Efectivo', 'Valencia');

-- Poblar No Ok Atributos
-- Correo de Medicos sin @
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Dego','Martinez',0,'d.marx.com',123,'Activo',250);
-- Monto de pago < 0
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Carlos', 'Perez',121111111, '111111@ex.com', 'Tarjeta', 'Madrid');
INSERT INTO Entidades (nombre, correo) VALUES ('C1mpensar', 'c1mpe@nsar.com');
INSERT INTO HistoriasClinicas (historia_id, paciente_id, nombre_entidad, fechaConsulta, motivoConsulta, diagnostico, tratamiento, fecha) VALUES (92999,121111111, 'C1mpensar', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Gastritis', 'Med A', TO_DATE('2023-01-10', 'YYYY-MM-DD'));
-- Primero insertamos un paciente, una entidad y una historia clinica. A partir de esto tratamos de insertar un pago con un monto < 0
INSERT INTO Pagos (pago_id, historia_id, paciente_id, fechaPago, monto, metodoPago, estadoPago, observaciones) VALUES (45000, 92999,121111111, TO_DATE('2023-01-15', 'YYYY-MM-DD'), -400, 'Tarjeta', 'Pagado', 'N/A');

