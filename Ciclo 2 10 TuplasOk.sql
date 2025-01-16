/*CK_PRUEBA_ESTADO_FECHA*/
-- Si el estado de una prueba es completado, entonces su fecha de realización no puede ser nula
INSERT INTO Diagnosticos VALUES (56,TO_DATE('2024-05-10','YYYY-MM-DD'),'Probable','Impresionante');
INSERT INTO PruebaDeLaboratorio VALUES (120, 'Hemograma', TO_DATE('2024-05-10','YYYY-MM-DD'), 'Pendiente', 'Completada',56);
/*CK_CITA_PRUEBALABORATORIO*/
-- Una prueba de laboratorio no puede tener más de un diagnostico si es del mismo tipo de prueba y a la misma hora
INSERT INTO Diagnosticos (diagnostico_id, fechaDiagnostico, tipoDiagnostico, descripcion) VALUES (5001, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Inicial', 'Dolor abdom');
INSERT INTO PruebaDeLaboratorio (id_prueba, id_diagnostico, fecha_realizacion, tipoDePrueba, estado) VALUES (100, 5001, TO_DATE('2024-07-01 10:00','YYYY-MM-DD HH24:MI'), 'Hemogram4', 'Pendiente');
/*CK_RECEPCION_NOTIFICACION*/
-- Una recepcion de notificacion si es recibida la fecha no puede ser nula
INSERT INTO JefesLaboratorio (id_jefe, nombre, apellido, telefono, correoElectronico, estado) VALUES(60, 'JefeNombre_60', 'JefeApellido_60', 5551060, 'jefe60@hospital.com', 'Activo');
SELECT * FROM JEFESLABORATORIO WHERE correoElectronico = 'jefe60@hospital.com';
INSERT INTO Pacientes (nombre, apellido, id, correo, metodosDePago, residencia) VALUES ('Carlos', 'Perez', 60, 'c.perez@60.com', 'Tarjeta', 'Madrid');
INSERT INTO Medicos (nombre, apellido, identificacion, correo, telefono, estado, numero_consultorio) VALUES ('Juan', 'Garcia', 160, 'j.60rcia@hospital.com', 987654321, 'Activo', 60);
INSERT INTO JornadasDeVacunacion (id_jornada, fecha, lugar, tipoDeVacuna, cantidadVacunasDisponibles) VALUES(60, TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'Plaza Mayor 2', 'Vacuna BCG', 50);
INSERT INTO ResultadoPruebas (id_resultado, resultado, fechaRegistro) VALUES (60, 'Negativo', TO_DATE('2024-03-26', 'YYYY-MM-DD'));
INSERT INTO Notificaciones (id_notificacion, contenido, id_jornada_notificaciones, identificacion_medicos, id_resultado, id_jefe, id_paciente) VALUES(60, '<mensaje>Vacunación programada para el 2024-03-10 en Plaza Mayor.</mensaje>', 60, 160, 60, 107, 60);
INSERT INTO RecepcionNotificacion (id_recepcion, fechaDeRecepcion, confirmacion, id_notificacion_recepcion) VALUES (60, TO_DATE('2024-05-11','YYYY-MM-DD'), 'Recibida', 60);


