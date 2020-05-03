<?php

require_once "../controladores/almacenes.controlador.php";
require_once "../modelos/almacenes.modelo.php";

class AjaxAlmacenes{

	/*=============================================
	EDITAR ALMACEN
	=============================================*/	

	public $idAlmacen;

	public function ajaxEditarAlmacen(){

		$item = "id";
		$valor = $this->idAlmacen;

		$respuesta = ControladorAlmacenes::ctrMostrarAlmacenes($item, $valor);

		echo json_encode($respuesta);


	}

}

/*=============================================
EDITAR ALMACEN
=============================================*/	

if(isset($_POST["idAlmacen"])){

	$almacen = new AjaxAlmacenes();
	$almacen -> idAlmacen = $_POST["idAlmacen"];
	$almacen -> ajaxEditarAlmacen();

}