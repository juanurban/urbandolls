<?php 

require_once "conexion.php";

class ModeloLogs {

	/*=============================================
	REGISTRO DE LOGS
	=============================================*/
	static public function mdlRegistrarLogs($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(etiqueta, descripcion, registro) VALUES (:etiqueta, :descripcion, NOW())");

		$stmt->bindParam(":etiqueta", $datos["etiqueta"], PDO::PARAM_STR);
		$stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
	
		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		$stmt->close();
		$stmt = null;

	}

}