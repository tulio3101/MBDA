CREATE VIEW Entidades_Diagnostico AS 
SELECT 
    Entidades.nombre AS Nombre_Entidad, 
    Diagnosticos.fechaDiagnostico AS Fecha_Diagnostico, 
    Diagnosticos.tipoDiagnostico AS Tipo_Diagnostico
FROM Entidades 
JOIN HistoriasClinicas 
    ON Entidades.nombre = HistoriasClinicas.nombre_entidad
JOIN TieneDiagnosticos 
    ON HistoriasClinicas.historia_id = TieneDiagnosticos.historia_id
JOIN Diagnosticos 
    ON TieneDiagnosticos.diagnostico_id = Diagnosticos.diagnostico_id;

CREATE INDEX IndicePacientes ON Pacientes(id,metodosDePago);
CREATE INDEX IndiceHistorias ON HistoriasClinicas(historia_id,paciente_id,nombre_entidad,fecha);