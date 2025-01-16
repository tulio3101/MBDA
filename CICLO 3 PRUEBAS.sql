/*En el Hospital San Gabriel, un hospital que antes solo permitia ingresar pacientes o atender pacientes urgentemente de la entidad x, actualiza sus politicas, servicios y luego de esto empieza
a contratar nuevo personal
*/
/*Por lo que llegan nuevos medicos al Hospital*/
EXECUTE PA_GERENTE.AD_MEDICOS('Andrés','Murcia',10250,'andr3_es@medico.com',7689703,'Activo',0);
EXECUTE PA_GERENTE.AD_MEDICOS('Julian','Calvache',10251,'juli4_anC@medico.com',316769,'Activo',0);
EXECUTE PA_GERENTE.AD_MEDICOS('Pedro','Pedromo',10252,'Pedro5_@medico.com',21332,'Activo',0);
EXECUTE PA_GERENTE.AD_MEDICOS('Ricardo','Montaner',10253,'Ricaa_rd6@medico.com',567865,'Activo',0);
/*De la misma manera, este hospital tiene asociado un nuevo laboratorio para hacer examenes medicos, de igual forma llega un nuevo jefe de laboratorio*/
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(6571,'Anderson','Baquero',3152386862,'Anderson@JefeLab5','Activo');
EXECUTE PA_GERENTE_LABORATORIO.AD_LAB(76749,'Lab-SanGabriel','Villapinzon',6578945,155);
/*Tras esto llego un paciente afiliado a la EPS LuchamosPorSanar y Camilo un paciente nuevo quiere registrarse, por lo que un medico practicante toma sus datos*/
EXECUTE PA_MEDICO.AD_PACIENTES('Camilo','Barrero',87994,'Camilo@brreeroo4.com','Efectivo','Bogotá');
/*Camilo recuerda que paga sus servicios basicos con su tarjeta de credito por lo que tiene que modificarlo, así como su residencia ya que se acaba de a mudar*/
EXECUTE PA_MEDICO.MO_PACIENTES(87994,'Tarjeta','Sopó');
/*Se crea su historia clinica correspondiente, añadiendolo al doctor Andrés Murcia*/
EXECUTE PA_MEDICO.AD_HISTORIAS_CLINICAS(456746,87994,'LuchamosP4rS1nar1',SYSDATE,'Fractura','Paciente en buen estado se le puede llegar a recetar medicamentos','Esperar proxima cita',SYSDATE);
/*Se le agenda una próxima cita, con su pago correspondiente*/
EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(8768782,87994,TO_DATE('2024-12-19', 'YYYY-MM-DD'),'Control','Cumplida','Primera Cita Tras revisión',10250,9898973);
/*Andrés el día de la cita va a consultarla con un secretario*/
DECLARE
    cursor_cita_pacientes SYS_REFCURSOR;
BEGIN
    cursor_cita_pacientes := PA_ADMINISTRATIVOS.CO_CITAS();
    DBMS_SQL.RETURN_RESULT(cursor_cita_pacientes);
END;
/*El Doctor Andrés genera una orden para una prueba de examenes de sangre, en el laboratorio asociado al hospital y le transmite la información al jefe de laboratorio*/
EXECUTE PA_JEFE_LABORATORIO.AD_PRUEBAS(86427,'Examen de Sangre',SYSDATE+8,'NO','Pendiente',111551);
/*Tras la prueba de laboratorio, se cambia su estado*/
EXECUTE PA_JEFE_LABORATORIO.MO_PRUEBAS(86427,'Completada');
/*La junta administrativa consulta la prueba y el contenido de las notificaciones*/
DECLARE
    cursor_resultados_paciente SYS_REFCURSOR;
BEGIN
    cursor_resultados_paciente := PA_JEFE_LABORATORIO.CO_PRUEBAS();
    DBMS_SQL.RETURN_RESULT(cursor_resultados_paciente);
END;
/*Después de esto se programa una nueva cita para ver los resultados de las pruebas*/
EXECUTE PA_ADMINISTRATIVOS.AD_CITAS(8768656,87994,TO_DATE('2024-12-24', 'YYYY-MM-DD'),'Control Fractura','Cumplida','Segunda Cita Tras revisión',10250,9898973);
/*Una vez en la cita medica, tras la revisión de los examanes el medico le asigna a camilo le asigna tomar vitamina B12 para subir la hemogoblina*/
/*Por lo que va a la junta administrativa para añadir los medicamentos*/
EXECUTE PA_ADMINISTRATIVOS.AD_MEDICAMENTOS('V1tam1na-B12',343538,10);
/*Se consultan los medicamentos*/
DECLARE
    cursor_medicamentos_paciente SYS_REFCURSOR;
BEGIN
    cursor_medicamentos_paciente := PA_ADMINISTRATIVOS.CO_MEDICAMENTOS();
    DBMS_SQL.RETURN_RESULT(cursor_medicamentos_paciente);
END;
/*1. En el pueblo de UNE, se estan buscando voluntarios para realizar una jornada de vacunación en contra del sarampion
por lo que se presentan voluntarios para vacunarlos */
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(1960,'Julian','Perez',123,'J4l29n@Jefe6','Activo');
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(1961,'Pedro','Sanchez',456,'P31r9@Jefe1','Activo');
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(1962,'Daniela','Riaño',789,'Dani4l8@Jefe2','Activo');
/*Tras unas semana se establece que el jefe de laboratorio que va a dirigri la jornada de vacunación es Pedro Sánchez*/
/*2. Por lo que se implementa la jornada de vacunación*/
EXECUTE PA_JEFE_LABORATORIO.AD_JORNADAS(12123,SYSDATE+25,'Universidad Militar','Sarampión',210);
/*3. Tras esto se quiere consultar la jornada de vacunación establecida, teniendo en cuenta el registro de todas las jornadas de vacunación que se han realizado antes*/
DECLARE
    cursor_jornadas_vacunacion SYS_REFCURSOR;
BEGIN
    cursor_jornadas_vacunacion := PA_JEFE_LABORATORIO.CO_JORNADAS();
    DBMS_SQL.RETURN_RESULT(cursor_jornadas_vacunacion);
END;
/*4. Al cabo de unas horas, llegaron vacunas para hepatitis b para las personas que quieran aplicarsela*/
EXECUTE PA_JEFE_LABORATORIO.MO_JORNADAS(12123,'Hepatitis B');
/*5. Tras la jornada de vacunación, la junta administrativa quiere revisar el tipo de vacunas restantes*/
DECLARE
    cursor_jornadas_de_vacunacion_vacunas SYS_REFCURSOR;
BEGIN
    cursor_jornadas_de_vacunacion_vacunas := PA_JUNTA_ADMINISTRATIVA.CO_TIPOS_VACUNAS();
    DBMS_SQL.RETURN_RESULT(cursor_jornadas_de_vacunacion_vacunas);
END;
/*6. Pasadas unas horas, una persona salió alergica a dicha vacuna, por lo cual se tiene que hacer una prueba de laboratorio, para ver de que es alergica*/
EXECUTE PA_JEFE_LABORATORIO.AD_PRUEBAS(99987,'Alergias',SYSDATE,NULL,'Pendiente',90014);
/*7. Realizada la prueba se cambia el estado a completada*/
EXECUTE PA_JEFE_LABORATORIO.MO_PRUEBAS(99987,'Completada');
/*8. Tras esto se consulta la prueba*/
DECLARE
    cursor_pruebas_alergias SYS_REFCURSOR;
BEGIN
    cursor_pruebas_alergias := PA_JEFE_LABORATORIO.CO_PRUEBAS();
    DBMS_SQL.RETURN_RESULT(cursor_pruebas_alergias);
END;
/*9. Realizada la prueba se obtiene el resultado de que la persona es alergica, pero un laboratorio se debe asegurar si las personas son alergicas o no, pero estas
no lo realizaron, por lo que se debe realizar el cierre del laboratorio*/
EXECUTE PA_GERENTE_LABORATORIO.MO_LAB(322,NULL,NULL);
/*10. Tras modificar el laboratorio de tal manera que su direccion como contacto sea nulo se procede a eliminar*/
EXECUTE PA_GERENTE_LABORATORIO.DEL_LAB(322);