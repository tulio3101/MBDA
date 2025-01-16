-- Prueba 1
INSERT INTO Entidades VALUES ('LuchamosP4rS1nar1','Luch4m4s@Sanar.com');
INSERT INTO Pagos VALUES (9898973,87993,SYSDATE,100200,'Efectivo','Pendiente','Se cobra por la cita');
INSERT INTO Diagnosticos VALUES (111551,SYSDATE+10,'Sangre','Pruebas de sangre');
-- Prueba 2
INSERT INTO Diagnosticos VALUES (90014,SYSDATE,'Alergica','Alergia Vacuna');
SELECT * FROM Laboratorios;