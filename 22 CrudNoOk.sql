/*AD_MEDICOS*/
EXECUTE PC_MEDICOS.AD_MEDICOS('Lamine','Yamal',10000,'0001@mail.com',316232,'Activo',2000);
/*Error al intentar insertar un medico con la misma identificacion*/
EXECUTE PC_MEDICOS.AD_MEDICOS('Lamine','Yamal',10000,'0001@mail.com',316232,'Activo',2000);
/*MO_MEDICOS*/
/*Se ejecuta pero no se modifica ningun elemento del medico ingresado anteriormente*/
EXECUTE PC_MEDICOS.MO_MEDICOS('Lionel','Messi',10000,'0000mail.com',316232,'Activo',2000);
SELECT * FROM Medicos WHERE identificacion = 10000;
/*DEL_MEDICOS*/
-- SE EJECUTA PERO ESTA ELIMINANDO UN MEDICO NO EXISTENTE
EXECUTE PC_MEDICOS.DEL_MEDICOS(10001);
/*AD_HISTORIAS_CLINICAS*/
EXECUTE PC_HISTORIAS_CLINICAS.AD_HISTORIAS_CLINICAS(1030,2000,'p',TO_DATE('2026-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Gastritis', 'Med A', TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO Pacientes VALUES ('Carlos', 'Perez', 2011, '2011@ex.com', 'Tarjeta', 'Madrid');
INSERT INTO Entidades VALUES ('2911', '2911@232ntry.com');
INSERT INTO HistoriasClinicas VALUES (1022,2011,'2911',TO_DATE('2026-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Gastritis', 'Med A', TO_DATE('2026-01-10', 'YYYY-MM-DD'));
/*MO_HISTORIAS_CLINICAS*/
SELECT * FROM  HistoriasClinicas WHERE historia_id = 1022;
/*Se Ejecuta pero en realidad no se modifica ninguno de los atributos de historias clinicas*/
EXECUTE PC_HISTORIAS_CLINICAS.MO_HISTORIAS_CLINICAS(1022,2011,'2911',TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'Dolor abdom', 'Gastritis', 'Med A', TO_DATE('2022-01-10', 'YYYY-MM-DD'));
/*DEL_HISTORIAS_CLINICAS*/
/*Se trata de eliminar una historia clinica que ni siquiera se pudo insertar*/
EXECUTE PC_HISTORIAS_CLINICAS.DEL_HISTORIAS_CLINICAS(1022);
/*AD_MEDICAMENTOS*/
EXECUTE PC_MEDICAMENTOS.AD_Medicamentos('prueba_1',9991,5);
/*AD_PACIENTES*/
-- Intentar insertar un paciente con un ID duplicado
EXECUTE PC_PACIENTES.AD_PACIENTES('Carlos', 'Pérez', 1, 'carlos@example.com', 'Tarjeta', 'Madrid');
-- Intentar modificar un paciente pasando un tipo de dato incorrecto
EXECUTE PC_PACIENTES.MO_PACIENTES('ABC', 'Tarjeta', 'Bogota');
/*DEL_PACIENTES*/
-- Intentar eliminar un paciente que no existe
EXECUTE PC_PACIENTES.DEL_PACIENTES(99999);
SELECT * FROM Pacientes WHERE id = 99999;
/*AD_CITAS*/
EXECUTE PC_CITAS.AD_CITAS(1, 1, TO_DATE('2023-01-15 09:00', 'YYYY-MM-DD HH24:MI'), 'Chequeo gen', 'Confirmada', 'Paciente puntual', 101, 1);