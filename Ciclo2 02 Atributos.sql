ALTER TABLE Pacientes ADD CONSTRAINT CK_Paciente_Correo CHECK(correo LIKE '%@%');
ALTER TABLE Medicos ADD CONSTRAINT CK_Medicos_Correo CHECK (correo LIKE '%@%');
ALTER TABLE Medicos ADD CONSTRAINT CK_Medicos_Estado CHECK (estado IN ('Activo','Inactivo'));
ALTER TABLE Especialistas ADD CONSTRAINT CK_Especialistas_Especialidad CHECK (especialidad IN ('Medicina Interna','Endocrinologia','Pediatria','Cirugia','Cardiologia','Dermatologia'));
ALTER TABLE MGeneral ADD CONSTRAINT CK_MGeneral_AreaAtencion CHECK (area_atencion IN ('Primera Infancia', 'Adultos', 'Tercera Edad', 'Adolescentes', 'General'));
ALTER TABLE Pacientes ADD CONSTRAINT CK_PACIENTES_METODOS_DE_PAGOS CHECK (metodosDePago IN ('Efectivo','Tarjeta','Transf'));
ALTER TABLE PruebaDeLaboratorio ADD CONSTRAINT CK_PRUEBA_ESTADO CHECK (estado IN ('Pendiente', 'Completada'));
ALTER TABLE JornadasDeVacunacion ADD CONSTRAINT CK_TIPO_VACUNA CHECK (tipoDeVacuna IN ('Vacuna BCG','Hepatitis B', 'Pentavalente', 'Rotavirus','Neumocócica','Sarampión'));
ALTER TABLE JefesLaboratorio ADD CONSTRAINT CK_ESTADO_JEFE CHECK (estado IN ('Activo','Inactivo','Suspendido'));
ALTER TABLE MediosDeComunicacion ADD CONSTRAINT CK_TIPO_MEDIO CHECK(tipo IN ('Celular','Correo','Carta'));
ALTER TABLE RecepcionNotificacion ADD CONSTRAINT CK_CONFIRMACION CHECK(confirmacion IN ('Recibida','No Recibido'));
ALTER TABLE JefesLaboratorio ADD CONSTRAINT CK_JEFE_LABORATORIO CHECK(CorreoElectronico LIKE '%@%');

