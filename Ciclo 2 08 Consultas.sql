/*Consultar el contenido de las notificaciones que se le realiza a una determinada prueba*/

SELECT Contenido 
    FROM Notificaciones N JOIN ResultadoPruebas R ON (N.id_resultado = R.id_resultado);

/*Consultar los resultados de las pruebas por fecha de registro*/

SELECT Resultado, Observacion 
    FROM ResultadoPruebas R JOIN Observaciones O ON (R.id_resultado = O.id_resultado)
    ORDER BY fechaRegistro;

/*Consultar los tipos de vacunas que se van a aplicar en la jornada de vacunación y su cantidad correspondiente*/

SELECT tipoDeVacuna, cantidadVacunasDisponibles FROM JornadasDeVacunacion;

/*Consultar el jefe de laboratorio que esta a cargo de una prueba de laboratorio*/

SELECT J.id_jefe AS JefeLaboratorio 
    FROM JefesLaboratorio J JOIN JefeDeLaboratorioRealizaPruebaDeLaboratorio JP ON (J.id_jefe = JP.id_jefe)
    JOIN PruebaDeLaboratorio PL ON (JP.id_prueba = PL.id_prueba);