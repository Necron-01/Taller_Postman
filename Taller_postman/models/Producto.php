<?php
    class Producto extends Conectar{
        public function get_producto(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT p.CodigoProd, p.NombreProd, P.CategoriaProd,c.NombreCategoria, p.Precio FROM producto=p 
            INNER JOIN categoria=c 
            ON p.CategoriaProd = c.IdCategoria 
            Where Disponibilidad=1";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
        }
        public function getid_producto($CodigoProd){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT p.CodigoProd, p.NombreProd, P.CategoriaProd,c.NombreCategoria, p.Precio  
            FROM producto=p INNER JOIN categoria=c 
            ON p.CategoriaProd = c.IdCategoria 
            where CodigoProd=$CodigoProd";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
        }
        public function insert_producto($CodigoProd, $NombreProd, $CategoriaProd, $Precio, $Cantidad, $Disponibilidad){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO producto (CodigoProd, NombreProd, CategoriaProd, Precio, Cantidad, Disponibilidad) 
            VALUES (?, ?, ?, ?, ?, ?)";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $CodigoProd);
            $sql->bindValue(2, $NombreProd);
            $sql->bindValue(3, $CategoriaProd);
            $sql->bindValue(4, $Precio);
            $sql->bindValue(5, $Cantidad);
            $sql->bindValue(6, $Disponibilidad);
            $sql->execute();
        }
        public function update_producto($CodigoProd, $NombreProd, $CategoriaProd, $Precio, $Cantidad){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE producto set NombreProd = ?, CategoriaProd = ?, Precio = ?, Cantidad = ? WHERE CodigoProd = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $NombreProd);
            $sql->bindValue(2, $CategoriaProd);
            $sql->bindValue(3, $Precio);
            $sql->bindValue(4, $Cantidad);
            $sql->bindValue(5, $CodigoProd);
            $sql->execute();
            return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
        }
        
        public function delete_producto($CodigoProd){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE producto set Disponibilidad = 0 WHERE CodigoProd = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $CodigoProd);
            $sql->execute();
            return $result=$sql->fetchAll(PDO::FETCH_ASSOC);
        }
    }
?>