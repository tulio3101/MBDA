/*Indice Pruebas Laboratorio*/
CREATE INDEX Indice_Pruebas_Laboratorio ON PruebaDeLaboratorio(id_prueba, estado);
/*Indice Notificaciones*/
CREATE INDEX Indice_Jornadas_Vacunacion ON JornadasDeVacunacion(id_jornada,tipoDeVacuna);
/*Vista*/
CREATE OR REPLACE VIEW Vista_Pacientes_Pruebas_Diagnosticos AS
SELECT 
    P.id AS paciente_id,
    P.nombre AS nombre_paciente,
    P.apellido AS apellido_paciente,
    P.correo AS correo_paciente,
    PL.id_prueba AS prueba_id,
    PL.tipoDePrueba,
    PL.fecha_realizacion,
    PL.resultadoPrevio,
    PL.estado AS estado_prueba,
    D.diagnostico_id,
    D.fechaDiagnostico,
    D.tipoDiagnostico,
    D.descripcion AS descripcion_diagnostico
FROM 
    Pacientes P
JOIN 
    PacientePidePruebasLaboratorio PPL ON P.id = PPL.id_paciente
JOIN 
    PruebaDeLaboratorio PL ON PPL.id_prueba_laboratorio = PL.id_prueba
JOIN 
    Diagnosticos D ON PL.id_diagnostico = D.diagnostico_id;