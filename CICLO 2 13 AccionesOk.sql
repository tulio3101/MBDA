/*Al eliminar un resultado de prueba se eliminaran las observaciones correspondientes */
INSERT INTO ResultadoPruebas (id_resultado, resultado, fechaRegistro) VALUES (80001, 'Negativo', TO_DATE('2024-05-20','YYYY-MM-DD'));

INSERT INTO Observaciones (observacion, id_resultado) VALUES ('Paciente sin síntomas', 80001);

INSERT INTO Observaciones (observacion, id_resultado) VALUES ('Recomendar control en 1 año', 80001);

DELETE FROM ResultadoPruebas WHERE id_resultado = 80001;


