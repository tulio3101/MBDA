CREATE TABLE Pacientes(
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    id NUMBER NOT NULL,
    correo VARCHAR(50),
    metodosDePago VARCHAR(20) NOT NULL,
    residencia VARCHAR(20) NOT NULL
    );
CREATE TABLE Diagnosticos(
    diagnostico_id NUMBER NOT NULL,
    fechaDiagnostico DATE NOT NULL,
    tipoDiagnostico VARCHAR(20) NOT NULL,
    descripcion VARCHAR(300)
    );
CREATE TABLE Medicamentos(
    nombre VARCHAR(20),
    id NUMBER NOT NULL,
    unidades NUMBER
    );
CREATE TABLE Medicos (
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    identificacion NUMBER NOT NULL,
    correo VARCHAR(50) NOT NULL,
    telefono NUMBER,
    estado VARCHAR(15) NOT NULL,
    numero_consultorio NUMBER
);
CREATE TABLE Especialistas(
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    identificacion_especialistas NUMBER NOT NULL,
    correo VARCHAR(30) NOT NULL,
    telefono NUMBER,
    estado VARCHAR(15) NOT NULL,
    especialidad VARCHAR(35) NOT NULL,
    numero_consultorio NUMBER
    );
CREATE TABLE MGeneral(
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    identificacion_m_general NUMBER NOT NULL,
    correo VARCHAR(30) NOT NULL,
    telefono NUMBER,
    estado VARCHAR(15) NOT NULL,
    area_atencion VARCHAR(25) NOT NULL,
    numero_consultorio NUMBER
    );
CREATE TABLE Laboratorios(
    id_laboratorio NUMBER NOT NULL,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    contacto NUMBER,
    id_jefe NUMBER NOT NULL
    );
CREATE TABLE ResultadoPruebas(
    id_resultado NUMBER NOT NULL,
    resultado VARCHAR(50),
    fechaRegistro DATE
    );
CREATE TABLE Observaciones(
    observacion VARCHAR(100) NOT NULL,
    id_resultado NUMBER NOT NULL
    );
CREATE TABLE Notificaciones(
    id_notificacion NUMBER NOT NULL,
    contenido XMLTYPE,
    id_jornada_notificaciones NUMBER NOT NULL,
    identificacion_medicos NUMBER NOT NULL,
    id_resultado NUMBER NOT NULL,
    id_jefe NUMBER NOT NULL,
    id_paciente NUMBER NOT NULL
    );
CREATE TABLE RecepcionNotificacion(
    id_recepcion NUMBER NOT NULL,
    fechaDeRecepcion DATE,
    confirmacion VARCHAR(20),
    id_notificacion_recepcion NUMBER NOT NULL
    );
CREATE TABLE MediosDeComunicacion(
    id_medio NUMBER NOT NULL,
    nombre VARCHAR(100),
    tipo VARCHAR(100),
    contacto NUMBER NOT NULL,
    RegionDeCobertura VARCHAR(15) NOT NULL,
    id_jefe NUMBER NOT NULL
    );
CREATE TABLE JefesLaboratorio(
    id_jefe NUMBER NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono NUMBER NOT NULL,
    correoElectronico VARCHAR(100),
    estado VARCHAR(35) NOT NULL
    );
CREATE TABLE JornadasDeVacunacion(
    id_jornada NUMBER NOT NULL,
    fecha DATE,
    lugar VARCHAR(100),
    tipoDeVacuna VARCHAR(100) NOT NULL,
    cantidadVacunasDisponibles NUMBER NOT NULL
    );
CREATE TABLE PruebaDeLaboratorio(
    id_prueba NUMBER NOT NULL,
    tipoDePrueba VARCHAR(50),
    fecha_realizacion DATE,
    resultadoPrevio VARCHAR(50),
    estado VARCHAR(25),
    id_diagnostico NUMBER NOT NULL
    );
CREATE TABLE MedicosResultadoPruebas(
    id_resultado NUMBER NOT NULL,
    identificacion NUMBER NOT NULL
    );
CREATE TABLE LaboratoriosTienenJefesLaboratorios(
    id_laboratorio NUMBER NOT NULL,
    id_jefe NUMBER NOT NULL
    );
CREATE TABLE JefesLaboratoriosRegistraResultadoPruebas(
    id_resultado NUMBER NOT NULL,
    id_jefe NUMBER NOT NULL
    );
CREATE TABLE LaboratoriosGeneranMedicamentos(
    id_laboratorio NUMBER NOT NULL,
    id_medicamentos NUMBER NOT NULL
    );
CREATE TABLE MedicosAsignanPruebas(
    id_pruebas NUMBER NOT NULL,
    identificacion_medicos NUMBER NOT NULL
    );
CREATE TABLE MedioComunicacionEnviaNotificacion(
    id_notificacion NUMBER NOT NULL,
    id_medio NUMBER NOT NULL
    );
CREATE TABLE PruebasLaboratorioJefeLaboratorio(
    id_prueba NUMBER NOT NULL,
    id_jefe NUMBER NOT NULL
    );
CREATE TABLE JefeLaboratorioOrganizaJornadasDeVacunacion(
    id_jefe NUMBER NOT NULL,
    id_jornada NUMBER NOT NULL
    );
CREATE TABLE PacientePideMedicamentos(
    id_paciente NUMBER NOT NULL,
    id_medicamentos NUMBER NOT NULL
    );
CREATE TABLE DiagnosticoAsignaMedicamentos(
    id_medicamentos NUMBER NOT NULL,
    diagnostico_id NUMBER NOT NULL
    );
CREATE TABLE MedicosGeneraDiagnosticos(
    identificacion_medico NUMBER NOT NULL,
    diagnostico_id NUMBER NOT NULL
    );
CREATE TABLE PacientePidePruebasLaboratorio(
    id_paciente NUMBER NOT NULL,
    id_prueba_laboratorio NUMBER NOT NULL
    );
CREATE TABLE JefeDeLaboratorioRealizaPruebaDeLaboratorio(
    id_prueba NUMBER NOT NULL,
    id_jefe NUMBER NOT NULL
    );