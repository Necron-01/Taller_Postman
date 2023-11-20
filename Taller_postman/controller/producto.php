<?php
    require_once("../config/conexion.php");
    require_once("../models/Producto.php");

    $producto = new Producto ();
    $body = json_decode(file_get_contents("php://input"), true);
    switch ($_GET["op"]) {
        case "GetAll";
        $datos=$producto->get_producto();
        echo json_encode($datos);
            break;
        case "GetId";
                $datos=$producto->getid_producto($body["CodigoProd"]);
                echo json_encode($datos);
            break;
        case "Insert";
                $datos=$producto->insert_producto($body["CodigoProd"], $body["NombreProd"], $body["CategoriaProd"], $body["Precio"], $body["Cantidad"], $body["Disponibilidad"]);
                echo ("Insert correcto");
            break;
        case "Update";
                $datos=$producto->update_producto($body["CodigoProd"], $body["NombreProd"], $body["CategoriaProd"], $body["Precio"], $body["Cantidad"]);
                echo ("Update correcto");
            break;
        case "Delete";
                $datos=$producto->delete_producto($body["CodigoProd"]);
                echo ("Delete Correcto");
            break;
    }
?>