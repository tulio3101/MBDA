-- Consultar la cantidad de medicos especializados que tiene el hospital
SELECT COUNT(identificacion_especialistas) AS Especializados
FROM Especialistas;
-- Consultar la cantidad de pacientes que pidieron una cita y ya realizaron el pago
SELECT COUNT(Pacientes.id) AS Pacientes
FROM Pacientes JOIN Citas ON (Pacientes.id = Citas.paciente_id)
JOIN Pagos ON (Pagos.pago_id = Citas.pago_id)
WHERE Citas.estado = 'Confirmada' AND Pagos.estadoPago = 'Pagado';
-- Cantidad de Pagos realizados por los pacientes
SELECT COUNT(pago_id) AS CantidadPagos
FROM Pacientes JOIN Pagos ON (id = paciente_id)
WHERE estadoPago = 'Pagado';
-- Consultas las citas de los pacientes por fecha
SELECT Pacientes.nombre AS Nombre_Paciente, Citas.cita_id AS Cita_ID, Citas.fechaHora AS Fecha_Hora
FROM Pacientes JOIN Citas ON (Pacientes.id = Citas.paciente_id)
ORDER BY fechaHora;
-- Consultar los medicamentos que ofrece el hospital
SELECT nombre, unidades FROM Medicamentos;
-- Consultar entidades asociadas a cada paciente
SELECT Pacientes.nombre AS Nombre_Pacientes, Pacientes.id AS Identificacion_Pacientes, nombre_entidad AS Entidad
FROM Pacientes 
JOIN TienePacientes ON (Pacientes.id = TienePacientes.paciente_id);
