ALTER TABLE Observaciones DROP CONSTRAINT FK_OBSERVACIONES_RESULTADOS;

ALTER TABLE Observaciones ADD CONSTRAINT FK_OBSERVACIONES_RESULTADO FOREIGN KEY (id_resultado) REFERENCES ResultadoPruebas(id_resultado) ON DELETE CASCADE;
