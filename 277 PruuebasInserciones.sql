INSERT INTO Pacientes VALUES('Carlos','Perez',8876,'C4rl2s8@6mail.com','Efectivo','Bogota');
INSERT INTO Pagos VALUES (554, 8876, SYSDATE , 100,'Transf','Pagado','Observacion');
--5
INSERT INTO Pagos VALUES (558,8876,TO_DATE('2026-04-15', 'YYYY-MM-DD'), 100,'Transf','Pagado','Observacion');
--8
INSERT INTO Entidades VALUES ('Compensar_3', 'Compensar_3@1.com');
---Prueba 2---
--1
INSERT INTO ENTIDADES VALUES ('Compensar_4','Compensar4@gmail.com');
--3 After Execute
INSERT INTO Pagos VALUES (1111,4444,TO_DATE('2025-12-25', 'YYYY-MM-DD'), 100,'Transf','Pagado','Observacion');
--10
--Before execute
ALTER TABLE HistoriasClinicas DROP CONSTRAINT FK_HistoriasClinicas_Pacientes;
ALTER TABLE Pagos DROP CONSTRAINT FK_PAGOS_PACIENTES;
ALTER TABLE Citas DROP CONSTRAINT FK_CITAS_PACIENTES;