CREATE TABLE Pacientes(
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    id NUMBER NOT NULL,
    correo VARCHAR(50),
    metodosDePago VARCHAR(20) NOT NULL,
    residencia VARCHAR(20) NOT NULL
    );
CREATE TABLE HistoriasClinicas(
    historia_id NUMBER NOT NULL,
    paciente_id NUMBER NOT NULL,
    nombre_entidad VARCHAR(20) NOT NULL,
    fechaConsulta DATE NOT NULL,
    motivoConsulta VARCHAR(20),
    diagnostico VARCHAR(200) ,
    tratamiento VARCHAR(300),
    fecha DATE NOT NULL
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
CREATE TABLE Citas(
    cita_id NUMBER NOT NULL,
    paciente_id NUMBER NOT NULL,
    fechaHora DATE NOT NULL,
    motivo VARCHAR(20),
    estado VARCHAR(20),
    observaciones VARCHAR(300),
    identificacion NUMBER NOT NULL,
    pago_id NUMBER NOT NULL
    );
CREATE TABLE Pagos(
    pago_id NUMBER NOT NULL,
    paciente_id NUMBER NOT NULL,
    fechaPago DATE NOT NULL,
    monto NUMBER NOT NULL,
    metodoPago VARCHAR(20),
    estadoPago VARCHAR(20),
    observaciones VARCHAR(300)
    );
CREATE TABLE Entidades(
    nombre VARCHAR(20) NOT NULL,
    correo VARCHAR(30)
    );
CREATE TABLE DireccionesEntidad(
    direccion VARCHAR(20) NOT NULL,
    nombre_entidad VARCHAR(20) NOT NULL
    );
CREATE TABLE TieneDiagnosticos(
    historia_id NUMBER NOT NULL,
    diagnostico_id NUMBER NOT NULL
    );
CREATE TABLE PideMedicamentos(
    id_paciente NUMBER NOT NULL,
    id_medicamentos NUMBER NOT NULL
    );
CREATE TABLE ProveeMedicamentos(
    nombre_entidad VARCHAR(20) NOT NULL,
    id_medicamentos NUMBER NOT NULL
    );
CREATE TABLE AsignaMedicamentos(
    id_medicamentos NUMBER NOT NULL,
    diagnostico_id NUMBER NOT NULL
    );
CREATE TABLE TienePacientes(
    paciente_id NUMBER NOT NULL,
    nombre_entidad VARCHAR(20) NOT NULL
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
CREATE TABLE MedicosAccedeHistoriasClinicas(
    historia_id NUMBER NOT NULL,
    identificacion NUMBER NOT NULL
    );
CREATE TABLE MedicosGeneranDiagnostico(
    diagnostico_id NUMBER NOT NULL,
    identificacion NUMBER NOT NULL
    );
CREATE TABLE EntidadTienenMedicos(
    nombre_entidad VARCHAR(20) NOT NULL,
    identificacion NUMBER NOT NULL
    );
