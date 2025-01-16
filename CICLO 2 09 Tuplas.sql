-- Si el estado de una prueba es completado, entonces su fecha de realización no puede ser nula
ALTER TABLE PruebaDeLaboratorio ADD CONSTRAINT CK_PRUEBA_ESTADO_FECHA CHECK (NOT (estado = 'Completada' AND fecha_realizacion IS NULL));
-- Una prueba de laboratorio no puede tener más de un diagnostico si es del mismo tipo de prueba y a la misma hora
ALTER TABLE PruebaDeLaboratorio ADD CONSTRAINT CK_CITA_PRUEBALABORATORIO UNIQUE (id_diagnostico,fecha_realizacion, tipoDePrueba);
-- Una recepcion de notificacion si es recibida la fecha no puede ser nula
ALTER TABLE RecepcionNotificacion ADD CONSTRAINT CK_RECEPCION_NOTIFICACION CHECK (NOT (confirmacion = 'Recibida' AND fechaDeRecepcion IS NULL));