<?php
require_once("BBDD_CTRLR.php");

if (isset($_REQUEST['peticion'])) {
    switch ($_REQUEST['peticion']) {
        case "login":
            $alias = $_REQUEST['alias'];
            $password = $_REQUEST['password'];
            $sql = "call login('$alias','$password')";
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
            $sql = "call mostar_mensaje_tema($temaid)";
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
            $sql = "call crear_usuario('$name', '$alias', '$password', '$email', '$foto')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql,'i');
            echo json_encode($datos);      
            break;
        
        case "enviar_mensaje":
            $mensaje = $_REQUEST['mensaje'];
            $id = $_REQUEST['id'];
            $tema = $_REQUEST['tema'];
            $sql = "call nuevo_mensaje('$mensaje','$id','$tema')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql,'i');
            echo json_encode($datos);      
            break;
        
        case "eliminar_mensaje":
            $menid = $_REQUEST['menid'];
            $sql = "call eliminar_mensaje('$menid')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql,'');
            echo json_encode($datos);      
            break;


    }        
}
