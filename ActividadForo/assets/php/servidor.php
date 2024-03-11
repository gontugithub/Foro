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

        case "mostrar_temas":
            $sql = "call mostrar_temas()";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            echo json_encode($datos);      
            break;

        case "mostrar_mensajes":
            $temaid = $_REQUEST['temaid'];
            $sql = "call mostar_mensaje_tema('$temaid')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            echo json_encode($datos);      
            break;

        case "nuevo_user":
            $name = $_REQUEST['name'];
            $alias = $_REQUEST['alias'];
            $email = $_REQUEST['email'];
            $password = $_REQUEST['password'];
            $foto = $_REQUEST['foto'];
            $sql = "call crear_usuario('$name', '$alias', '$email', '$password' , '$foto')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql,'i');
            echo json_encode($datos);      
            break;

    }        
}
