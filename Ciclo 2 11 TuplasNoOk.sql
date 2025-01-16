/*CK_PRUEBA_ESTADO_FECHA*/
-- Si el estado de una prueba es completado, entonces su fecha de realización no puede ser nula
INSERT INTO Diagnosticos VALUES (80,TO_DATE('2024-05-10','YYYY-MM-DD'),'Probable','Impresionante');
INSERT INTO PruebaDeLaboratorio (id_prueba, tipoDePrueba, fecha_realizacion, resultadoPrevio, estado,id_diagnostico) VALUES (10002, 'Radiografía', NULL, 'Pendiente', 'Completada',80);
/*CK_CITA_PRUEBALABORATORIO*/
-- Una prueba de laboratorio no puede tener más de un diagnostico si es del mismo tipo de prueba y a la misma hora
INSERT INTO Diagnosticos VALUES (5002,TO_DATE('2024-05-10','YYYY-MM-DD'),'Probable','Impresionante');
INSERT INTO PruebaDeLaboratorio (id_prueba, id_diagnostico, fecha_realizacion, tipoDePrueba, estado) VALUES (101, 5002, TO_DATE('2024-07-01 18:00','YYYY-MM-DD HH24:MI'), 'Hemograma 65', 'Pendiente');
INSERT INTO PruebaDeLaboratorio (id_prueba, id_diagnostico, fecha_realizacion, tipoDePrueba, estado) VALUES (102, 5002, TO_DATE('2024-07-01 18:00','YYYY-MM-DD HH24:MI'), 'Hemograma 65', 'Pendiente');
/*CK_RECEPCION_NOTIFICACION*/
-- Una recepcion de notificacion si es recibida la fecha no puede ser nula
INSERT INTO JefesLaboratorio (id_jefe, nombre, apellido, telefono, correoElectronico, estado) VALUES(61, 'JefeNombre_61', 'JefeApellido_61', 56151060, 'jefe61@hospital.com', 'Activo');
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Carlos', 'Perez', 61, 'c.perez@61.com', 'Tarjeta', 'Madrid');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Juan', 'Garcia', 161, 'j.61rcia@hospital.com', 987654321, 'Activo', 61);
INSERT INTO JornadasDeVacunacion (id_jornada, fecha, lugar, tipoDeVacuna, cantidadVacunasDisponibles) VALUES(61, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Plaza Mayor 12', 'Vacuna BCG', 50);
INSERT INTO ResultadoPruebas (id_resultado, resultado, fechaRegistro) VALUES (61, 'Negativo', TO_DATE('2024-03-26', 'YYYY-MM-DD'));
INSERT INTO Notificaciones (id_notificacion, contenido, id_jornada_notificaciones, identificacion_medicos, id_resultado, id_jefe, id_paciente) VALUES(61, '<mensaje>Vacunación programada para el 2024-03-10 en Plaza Mayor.</mensaje>', 61, 161, 61, 61, 61);
INSERT INTO RecepcionNotificacion (id_recepcion, fechaDeRecepcion, confirmacion, id_notificacion_recepcion) VALUES (61, NULL, 'Recibida', 61);
