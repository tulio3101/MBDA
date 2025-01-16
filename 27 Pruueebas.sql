-------------------------PRUEBAS--------------------------
/*
1
Luego de unos meses de vacaciones en el hospital san gabriel se ha decidido mejorar la planta
en la seccion de medicos por esto llegan dos nuevos El Doctor Daniel Y la Doctora Ana
*/

EXECUTE PA_GERENTE.AD_MEDICOS('Daniel','Guevara',98987,'danielg@hotmail.com',31523,'Activo',8765);
SELECT * FROM Medicos WHERE identificacion = 98987;
-- 2.
EXECUTE PA_GERENTE.AD_MEDICOS('Ana','Lopez',98988,'analop@hotmail.com',31523,'Activo',8766);
SELECT * FROM Medicos WHERE identificacion = 98988;
/*
3.
Carlos un usuario de la EPS COMPENSAR
se acordo que hace 2 a?os le dijeron que tenia que pedir una cita
para llevar un control sobre una posible diabetes entonces tiene que
pedir su cita pero para esto quiere pedirle a el secretario porque le dijeron
que en ese lugar no atendian a gente de esa EPS el secretario le dice que no hay problema que si puede
asistir y que le deje los datos
*/

EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(77896, 8876, TO_DATE('2026-04-15 06:00', 'YYYY-MM-DD HH24:MI'), 'Control Diabetes', 'Cumplida', 'Control sobre una posible', 10001, 554);

-- 4. Para Confirmar Su Cita Carlos Quiere Consultarla
DECLARE 
    cita2 SYS_REFCURSOR;
BEGIN 
    cita2 := PA_ADMINISTRATIVOS.CO_CITAS();
    DBMS_SQL.RETURN_RESULT(cita2);
END;
-- 5. Asi mismo Carlos quiere aprovechar el momento para sacar una cita por un dolor de estomago leve que tiene 
--Durante los ultimos 7 dias
EXECUTE PC_CITAS.AD_CITAS(7676,8876,TO_DATE('2026-04-23', 'YYYY-MM-DD'),'Dolor Estomacal','Cumplida','El paciente tiene dolor hace 1 semana',10001,558);
-- 6. Para Confirmar Su Cita Carlos Quiere Consultarla Y asegurarse que esta bien
DECLARE 
    cita1 SYS_REFCURSOR;
BEGIN 
    cita1 := PA_ADMINISTRATIVOS.CO_CITAS();
    DBMS_SQL.RETURN_RESULT(cita1);
END;
/*
7.Llega el dia de la primera cita y el doctor Daniel agrega al paciente a su control de hace 2 a?os a la base de datos a partir
de los datos proporcionados por el paciente ese dia con su toda la informacion, 
pero lo ingreso con otra identificacion ya que se dio cuenta de que no habia quedado registrado bien, ya que la residencia no era Bogota si no VillaDeLeyva
y de la misma manera coloco el correo donde trabaja
*/
EXECUTE PA_MEDICO.AD_PACIENTES('Carlos','Perez', 8877,'CarlosTrabajo@gm.com','Efectivo', 'VillaDeLeyva');
-- 8. Finalizado esto se Agrega La historia Final De Carlos a el hospital residente con la eps COMPENSAR
EXECUTE PA_MEDICO.AD_HISTORIAS_CLINICAS(2030,8877,'Compensar_3',TO_DATE('2024-12-31', 'YYYY-MM-DD'),'Diabetes','DIABETES Tipo 1','Control Cada Mes',SYSDATE);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2030;
/*
9.
Carlos tiene tiempo libre y va a ir con su abuela a la drogueria que el secretario le dijo que igualmente
en cualquier drogueria podia pedir sus medicamentos sin importar de que entidad era
por lo que quier consultar los medicamentos asignados en la primera cita que tuvo
*/
DECLARE
    cursor_medicamentos_cita1 SYS_REFCURSOR;
BEGIN
    cursor_medicamentos_cita1 := PC_MEDICAMENTOS.CO_MEDICAMENTO_HOSPITAL();
    DBMS_SQL.RETURN_RESULT(cursor_medicamentos_cita1);
END;
/*
10.
Llega el dia de la cita por el dolor de estomago y la doctora ana tras una revison lo agrega a la base de datos pero como
los datos ya estaban no tiene que a?adirlo, pero Carlos al revisar los datos
se da cuenta que quiere cambiar su metodo de pago a transferencia por lo cual hay que modificarlo
*/
EXECUTE PA_MEDICO.MO_PACIENTES(8877,'Transf', 'VillaDeLeyva');
SELECT * FROM Pacientes WHERE id = 8877;
-- 11. Finalizado esto se Agrega La historia Final De Carlos a el hospital 
EXECUTE PA_MEDICO.AD_HISTORIAS_CLINICAS(2031,8877,'Compensar_3',TO_DATE('2025-01-10', 'YYYY-MM-DD'),'Dolor Frecuente','El paciente tiene acidez se recetan varios medicamentos','Esomeprazol Cada 8 horas',SYSDATE);
SELECT * FROM HistoriasClinicas WHERE historia_id = 2031;
--12.Los administrativos tienen que agregar la cantidad recetada de medicamentos entonces es agregada a la base de datos el esomeprazol
EXECUTE PA_ADMINISTRATIVOS.AD_MEDICAMENTOS('Esomeprazol',10000000,3);
SELECT * FROM Medicamentos WHERE id = 10000000;
------------------------------------------------------------Pruebas---------------------------------------------------
/*
1. El hospital San gabriel ha entrado en un periodo de vacaciones por lo cual tiene que cambiar el estado de los doctores a inactivo
*/
EXECUTE PA_GERENTE.MO_MEDICOS('Daniel','Guevara',98987,'danielg@hotmail.com',31523,'Inactivo',8765);
EXECUTE PA_GERENTE.MO_MEDICOS('Ana','Lopez',98988,'analop@hotmail.com',31523,'Inactivo',8766);

SELECT * FROM Medicos WHERE identificacion = 98987;
SELECT * FROM Medicos WHERE identificacion = 98988;

/*
2. A partir de esto se contrataron nuevos medicos temporales en este periodo de vacaciones
*/
EXECUTE PA_GERENTE.AD_MEDICOS('Juan','Perez',98989,'juanpz@hotmail.com',31523,'Activo',8765);
EXECUTE PA_GERENTE.AD_MEDICOS('Laura','Sanchez',98990,'lauraSzc@hotmail.com',318232,'Activo',8766);
EXECUTE PA_GERENTE.AD_MEDICOS('Sebastian','Guevara',98991,'SebastianGue@hotmail.com',317676,'Activo',8767);
EXECUTE PA_GERENTE.AD_MEDICOS('Julian','Ria?o',98992,'JulianRia?o@hotmail.com',315432,'Activo',8768);
SELECT * FROM Medicos;

/*
3. Llega un paciente por urgencias y r?pidamente se toma sus datos, por otra parte se insertan sus datos correspondientes a los pagos
*/
EXECUTE PC_PACIENTES.AD_PACIENTES('Rodrigo','Gualtero',4444,'Rodri33@gmail.com','Efectivo','Bogota');
SELECT * FROM Pacientes;
/*
4. Despu?s de esto se le agrega una nueva historia clinica con otra entidad distinta a la del paciente anterior
ya que Compensar 3 y Compensar 4 manejan diferentes servicios
*/
EXECUTE PC_HISTORIAS_CLINICAS.AD_HISTORIAS_CLINICAS(6666,4444,'Compensar_4',SYSDATE,'Urgencias','Contuncion','Reposo',SYSDATE);
SELECT * FROM HistoriasClinicas;
/*
5. Luego de una revisi?n la historia clinica es actualizada el tratamiento son radiografias urgentes un tac
*/
EXECUTE PA_MEDICO.MOD_HISTORIAS_CLINICAS(6666,4444,'Compensar_4',SYSDATE,'Urgencias','Radiografias, radio mano derecha por posible factura','Reposo',SYSDATE);
/*
6. El paciente necesita ser operado de urgencia y se le asignan citas cada dos meses, por lo que los administrativos se encargan de programar estas citas.
*/
EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(5556,4444,TO_DATE('2027-01-10', 'YYYY-MM-DD'),'Control Cirugia','Cumplida','Primera cita tras cirugia',98989,1111);
EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(5557,4444,TO_DATE('2027-03-10', 'YYYY-MM-DD'),'Control Cirugia','Cumplida','Segunda cita tras cirugia',98989,1111);
EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(5558,4444,TO_DATE('2027-05-10', 'YYYY-MM-DD'),'Control Cirugia','Cumplida','Tercera cita tras cirugia',98989,1111);
EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(5559,4444,TO_DATE('2027-07-10', 'YYYY-MM-DD'),'Control Cirugia','Cumplida','Cuarta cita tras cirugia',98989,1111);

/*
7. Tras a?adir las citas, los correspondientes administrativos consultan dichas
*/
DECLARE
    cursor_citas_2 SYS_REFCURSOR;
BEGIN
    cursor_citas_2 := PA_ADMINISTRATIVOS.CO_CITAS();
    DBMS_SQL.RETURN_RESULT(cursor_citas_2);
END;
/*
8. Para todas las citas que se programaron se tiene previsto asignar determinados medicamentos generales, en caso de que se presente dolor
*/
EXECUTE PA_ADMINISTRATIVOS.AD_MEDICAMENTOS('Dicloofenaco',7780,1);
EXECUTE PA_ADMINISTRATIVOS.AD_MEDICAMENTOS('Ibuprofeeno',7777,6);
EXECUTE PA_ADMINISTRATIVOS.AD_MEDICAMENTOS('Meloxicam',7778,7);
EXECUTE PA_ADMINISTRATIVOS.AD_MEDICAMENTOS('Tramadol',7779,8);
/*
9. Los administrativos consultan los medicamentos
*/
DECLARE
    cursor_medicamentos_3 SYS_REFCURSOR;
BEGIN
    cursor_medicamentos_3 := PA_ADMINISTRATIVOS.CO_MEDICAMENTOS();
    DBMS_SQL.RETURN_RESULT(cursor_medicamentos_3);
END;
/*
10. Se ha presentado una pandemia global, Rodrigo ha sido infectado llevandolo a un estado de muerte teniendo que ser eliminado de la base de datos, por lo que se desahabilitar? sus historias clinicas y pagos asociados.
*/
EXECUTE PA_MEDICO.DEL_PACIENTES(4444);
/*
11. Los administradores quieren confirmar que se haya eliminado todo lo relacionado con Rodrigo
*/
SELECT * FROM PACIENTES WHERE ID = 4444;
/*
12. En el desarrollo de la pandamia el hospital necesita de m?s medicos por los que sigue contratando para seguir luchando contra esta.
*/
EXECUTE PA_GERENTE.AD_MEDICOS('Camila','Diaz',99001,'camila.diaz@hospital.com',319000,'Activo',8770);
EXECUTE PA_GERENTE.AD_MEDICOS('Felipe','Rodriguez',99002,'felipe.rodriguez@hospital.com',319001,'Activo',8771);
EXECUTE PA_GERENTE.AD_MEDICOS('Maria','Gomez',99003,'maria.gomez@hospital.com',319002,'Activo',8772);
SELECT * FROM MEDICOS;