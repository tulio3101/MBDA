-- Intento de insertar una prueba de laboratorio con un estado diferente a los definidos
INSERT INTO PruebaDeLaboratorio VALUES (1,'tipo1',SYSDATE,NULL,'Sin Confirmar',1);
-- Intento de insertar un correo sin @
INSERT INTO JefesLaboratorio VALUES (1,'Juan','Perez',123,'juan123','Activo');
-- Intento de insertar un valor NULL cuando no es posible
INSERT INTO ResultadoPruebas VALUES (NULL,'Optimista',SYSDATE);
-- Intento de insertar una confirmación diferente a la definida en los atributos
INSERT INTO RecepcionNotificacion VALUES (1,SYSDATE,'Pendiente',1);
-- Intento de insertar un tipo de medio diferente
INSERT INTO MediosDeComunicacion VALUES (1,'Verbal','Televisión',987,'Bogota');
-- Intento de insertar un estado de medico nulo, primero insertamos un medio de comunicación
INSERT INTO MediosDeComunicacion VALUES (1,'Verbal','Celular',567,'Zipaquira');
INSERT INTO JefesLaboratorio VALUES (2,'Pedro','Perez',456,'Pedro@gmail.com',NULL,1);
-- Intento de insertar un dato nulo
INSERT INTO JefesLaboratorio VALUES (2,'Diego','Sanabria',567,'Diego@gmail.com','Activo');
INSERT INTO Laboratorios VALUES (NULL,'Julian',NULL,676,2);
-- Intento de insertar un nombre nulo de un jefe de laboratorio
INSERT INTO MediosDeComunicacion VALUES (2, 'Correo','Carta',657,'Sopo');
INSERT INTO JefesLaboratorio VALUES (3,NULL,'Cortes',876,'cortes@gmail.com','Activo',2);
-- Intento de insertar un tipo de vacuna no disponible o diferente a las definidas
INSERT INTO JornadasDeVacunacion VALUES (1,SYSDATE,'Bogotá','Astrazeneca',25);