<?php
require_once("BBDD_CTRLR.php");

if (isset($_REQUEST['peticion'])) {
    switch ($_REQUEST['peticion']) {
        case "Login":
            //Recuperar alias de la URL
            $alias = $_REQUEST['alias'];
            //Recuperar password de la URL
            $password = $_REQUEST['password'];
            //SQL QUE LO COMPRUEBA
            // Utilizando procedures
            $sql = "CALL Usuarios_Login('$alias', '$password')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            echo json_encode($datos);      
            break;
        case "Registro":
            $nombre = $_REQUEST['nombre'];
            $alias = $_REQUEST['alias'];
            //Recuperar password de la URL
            $password = $_REQUEST['password'];
            //SQL QUE LO COMPRUEBA
            // Utilizando procedures
            $sql = "CALL Usuarios_I('$nombre', '$alias', '$password')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, "i");
            echo json_encode($datos);      
            break;
        case "Deportes":     
            $sql = "SELECT * FROM deportes";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            echo json_encode($datos);      
            break;
        case "Deportistas":     
            $sql = "SELECT dta_nombre FROM deportistas";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            echo json_encode($datos);      
            break;
    }        
}
