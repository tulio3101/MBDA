-- Un paciente no puede tener dos citas en la misma fecha y hora
ALTER TABLE Citas ADD CONSTRAINT CitaPacienteFecha UNIQUE (paciente_id, fechaHora);
-- Si el estado de la cita es "Cancelada", el atributo observaciones no puede ser nulo se debería registrar
ALTER TABLE Citas
ADD CONSTRAINT CK_CITAS_OBSERVACIONES
CHECK (NOT(estado = 'Cancelada' AND observaciones IS NULL));
-- Si el estadoPago es Confirmado, el monto debe ser mayor a 0
ALTER TABLE Pagos
ADD CONSTRAINT CK_PAGOS_MONTO_NUEVO
CHECK (NOT (estadoPago = 'Pagado' AND monto <= 0));

