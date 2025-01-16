/*1. En una aplicacion de trabajo se busca jefes de laboratorio y se presentan dos candidatos importantes, donde dejan sus datos convenciendo al gerente de contratarlos*/
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(2007,'Stiven','Rodriguez',3123,'St1v31n@4218','Activo');
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(2008,'Daniel','Gomez',3123,'D8n39l@3080','Activo');
/*Tras unas duras semanas de investigación de los perfiles para ser jefes de laboratorio se determino que Stiven era la mejor opción para llevar el laboratorio*/
/*2. En la ciudad de bogota se va a inagurar un nuevo laboratorio llamado Dakiti 2, ubicado en la localidad de santa fé por lo cual se tiene que añadir a la base de datos*/
EXECUTE PA_GERENTE_LABORATORIO.AD_LAB(4000,'Dakiti 2','Santa Fe Residencial',121,146);
/*3. Tras esto quiere consultar todos los jefes de laboratorio que existen en el lab*/
DECLARE
    cursor_gerente_lab SYS_REFCURSOR;
BEGIN
    cursor_gerente_lab := PA_GERENTE_LABORATORIO.CO_JEFELAB();
    DBMS_SQL.RETURN_RESULT(cursor_gerente_lab);
END;
/*4. El jefe va a añadir una prueba porque un paciente después de una cita necesita realizar determinadas pruebas*/
EXECUTE PA_JEFE_LABORATORIO.AD_PRUEBAS(9155,'Examenes Sangre',SYSDATE+4,'Negativo','Pendiente',9115);
/*5. El gerente se da cuenta, que un dato del jefe de laboratorio esta mal, que es el telefono ya que el jefe de laboratorio al presentar sus datos había puesto mal el número de telefono*/
EXECUTE PA_GERENTE_LABORATORIO.MO_JEFE(146,3167690706);
/*6. Después de una semana se dio cuenta que el estado de la prueba adicionada no se ha cambiado tras su realización, por lo que se procede a cambiarla */
EXECUTE PA_JEFE_LABORATORIO.MO_PRUEBAS(9155,'Completada');
/*7. El jefe de laboratorio agrega los resultados de la prueba anterior a la base de datos*/
EXECUTE PA_JEFE_LABORATORIO.AD_RESULTADOS(9145,'Globulos Rojos Normales',SYSDATE+8);
/*8. Se busca consultar estas pruebas, pero como han pasado más de 8 días se encuentra un aglomerado de pruebas realizadas*/
DECLARE
    cursor_ad_resultados SYS_REFCURSOR;
BEGIN
    cursor_ad_resultados := PA_JEFE_LABORATORIO.CO_RESULTADOS();
    DBMS_SQL.RETURN_RESULT(cursor_ad_resultados);
END;
/*9. La junta administrativa, quiere consultar el contenido de una notificación del resultado de la prueba para enviarselo al paciente*/
DECLARE
    cursor_junta_administrativa SYS_REFCURSOR;
BEGIN
    cursor_junta_administrativa := PA_JUNTA_ADMINISTRATIVA.CO_CONTENIDO_NOTIFICACIONES();
    DBMS_SQL.RETURN_RESULT(cursor_junta_administrativa);
END;
/*10. La junta administrativa quiere consultar los resultados de las pruebas, para llevar un control de que todo tenga sentido*/
DECLARE
    cursor_junta_administrativa_2 SYS_REFCURSOR;
BEGIN
    cursor_junta_administrativa_2 := PA_JUNTA_ADMINISTRATIVA.CO_RESULTADO_PRUEBAS();
    DBMS_SQL.RETURN_RESULT(cursor_junta_administrativa_2);
END;
----------------------------------------- Prueba 2 --------------------------------------
/*1. En el pueblo de UNE, se estan buscando voluntarios para realizar una jornada de vacunación en contra del sarampion
por lo que se presentan voluntarios para vacunarlos */
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(1931,'Julian','Perez',123,'J4l19n@343','Activo');
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(1932,'Pedro','Sanchez',456,'P31r9@2165','Activo');
EXECUTE PA_GERENTE_LABORATORIO.AD_JEFE(1933,'Daniela','Riaño',789,'Dani4l8@273','Activo');
/*Tras unas semana se establece que el jefe de laboratorio que va a dirigri la jornada de vacunación es Pedro Sánchez*/
/*2. Por lo que se implementa la jornada de vacunación*/
EXECUTE PA_JEFE_LABORATORIO.AD_JORNADAS(12110,SYSDATE+25,'Universidad del Rosario','Sarampión',210);
/*3. Tras esto se quiere consultar la jornada de vacunación establecida, teniendo en cuenta el registro de todas las jornadas de vacunación que se han realizado antes*/
DECLARE
    cursor_jornadas_vacunacion SYS_REFCURSOR;
BEGIN
    cursor_jornadas_vacunacion := PA_JEFE_LABORATORIO.CO_JORNADAS();
    DBMS_SQL.RETURN_RESULT(cursor_jornadas_vacunacion);
END;
/*4. Al cabo de unas horas, llegaron vacunas para hepatitis b para las personas que quieran aplicarsela*/
EXECUTE PA_JEFE_LABORATORIO.MO_JORNADAS(12110,'Hepatitis B');
/*5. Tras la jornada de vacunación, la junta administrativa quiere revisar el tipo de vacunas restantes*/
DECLARE
    cursor_jornadas_de_vacunacion_vacunas SYS_REFCURSOR;
BEGIN
    cursor_jornadas_de_vacunacion_vacunas := PA_JUNTA_ADMINISTRATIVA.CO_TIPOS_VACUNAS();
    DBMS_SQL.RETURN_RESULT(cursor_jornadas_de_vacunacion_vacunas);
END;
/*6. Pasadas unas horas, una persona salió alergica a dicha vacuna, por lo cual se tiene que hacer una prueba de laboratorio, para ver de que es alergica*/
EXECUTE PA_JEFE_LABORATORIO.AD_PRUEBAS(99990,'Alergias',SYSDATE,NULL,'Pendiente',90010);
/*7. Realizada la prueba se cambia el estado a completada*/
EXECUTE PA_JEFE_LABORATORIO.MO_PRUEBAS(99990,'Completada');
/*8. Tras esto se consulta la prueba*/
DECLARE
    cursor_pruebas_alergias SYS_REFCURSOR;
BEGIN
    cursor_pruebas_alergias := PA_JEFE_LABORATORIO.CO_PRUEBAS();
    DBMS_SQL.RETURN_RESULT(cursor_pruebas_alergias);
END;
/*9. Realizada la prueba se obtiene el resultado de que la persona es alergica, pero un laboratorio se debe asegurar si las personas son alergicas o no, pero estas
no lo realizaron, por lo que se debe realizar el cierre del laboratorio*/
EXECUTE PA_GERENTE_LABORATORIO.MO_LAB(313,NULL,NULL);
/*10. Tras modificar el laboratorio de tal manera que su direccion como contacto sea nulo se procede a eliminar*/
EXECUTE PA_GERENTE_LABORATORIO.DEL_LAB(313);