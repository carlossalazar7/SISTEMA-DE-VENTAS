<?php
//Herencia
class Categoria extends Database
{

    public function all()
    {
        try {
            $result = parent::connect()->prepare("SELECT * FROM MT_categorias");
            $result->execute();
            return json_encode($result->fetchAll());
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function register($data)
    {
        try {
            $result = parent::connect()->prepare("INSERT INTO MT_categorias (id, nombre) VALUES (?,?)");
            $result->bindParam(1, $data['id'], PDO::PARAM_STR);
            $result->bindParam(2, $data['nombre'], PDO::PARAM_STR);
            return $result->execute();
        } catch (Exception $e) {
            die("Error Categoria->register() " . $e->getMessage());
        }
    }

    public function find($id)
    {
        try {
            $result = parent::connect()->prepare("SELECT * FROM MT_categorias WHERE id = ?");
            $result->bindParam(1, $id, PDO::PARAM_INT);
            $result->execute();
            return json_encode($result->fetch());
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function update_register($data)
    {
        try {
            $result = parent::connect()->prepare("UPDATE MT_categorias SET name = ? WHERE id = ?");
            $result->bindParam(1, $data['name'], PDO::PARAM_STR);
            $result->bindParam(3, $data['id'], PDO::PARAM_INT);
            return $result->execute();
        } catch (Exception $e) {
            die("Error Categoria->update_register() " . $e->getMessage());
        }
    }
}
