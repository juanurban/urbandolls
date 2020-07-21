<?php 

require_once "conexion.php";

class ModeloLogs {

	/*=============================================
	REGISTRO DE LOGS
	=============================================*/
	static public function mdlRegistrarLogs($tabla, $datos){

		$id = isset($_SESSION["id"]) ? $_SESSION["id"] : null;
		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(etiqueta, descripcion, registro, usuario_id) VALUES (:etiqueta, :descripcion, NOW(), :usuario_id)");

		$stmt->bindParam(":etiqueta", $datos["etiqueta"], PDO::PARAM_STR);
		$stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(":usuario_id", $id, PDO::PARAM_STR);
	
		if($stmt->execute()){
			return "ok";
		}else{
			return "error";
		}

		$stmt->close();
		$stmt = null;

	}

}