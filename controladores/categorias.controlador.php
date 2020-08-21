<?php

class ControladorCategorias{

	/*=============================================
	CREAR CATEGORIAS
	=============================================*/

	static public function ctrCrearCategoria(){
		$tabla_logs = "logs";
		if(isset($_POST["nuevaCategoria"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaCategoria"])){

				$tabla = "categorias";
				$tabla_logs = "logs";
				$datos = $_POST["nuevaCategoria"];

				$respuesta = ModeloCategorias::mdlIngresarCategoria($tabla, $datos);

				if($respuesta == "ok"){

					ModeloLogs::mdlRegistrarLogs($tabla_logs, array(
						"etiqueta" => "Categorias Controlador",
						"descripcion" => "Categoria creada exitosamente.  CATEGORIA: {$_POST["nuevaCategoria"]}",
					));

					echo'<script>

					swal({
						  type: "success",
						  title: "La categoría ha sido guardada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "categorias";

									}
								})

					</script>';

				}


		    	}else{
				
				 ModeloLogs::mdlRegistrarLogs($tabla_logs, array(
					"etiqueta" => "Categorias Controlador",
					"descripcion" => "Categoria no creada. CATEGORIA: {$_POST["nuevaCategoria"]}",
				));

				 echo'<script>

					swal({
						  type: "error",
						  title: "¡La categoría no puede ir vacía o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "categorias";

							}
						})

			    	</script>';

			}

		}

	}

	/*=============================================
	MOSTRAR CATEGORIAS
	=============================================*/

	static public function ctrMostrarCategorias($item, $valor){

		$tabla = "categorias";

		$respuesta = ModeloCategorias::mdlMostrarCategorias($tabla, $item, $valor);

		return $respuesta;
	
	}

	/*=============================================
	EDITAR CATEGORIA
	=============================================*/

	static public function ctrEditarCategoria(){
		$tabla_logs = "logs";

		if(isset($_POST["editarCategoria"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarCategoria"])){

				$tabla = "categorias";
				
				$datos = array("categoria"=>$_POST["editarCategoria"],
							   "id"=>$_POST["idCategoria"]);

				$respuesta = ModeloCategorias::mdlEditarCategoria($tabla, $datos);

				if($respuesta == "ok"){
					ModeloLogs::mdlRegistrarLogs($tabla_logs, array(
						"etiqueta" => "Categorias Controlador",
						"descripcion" => "Categoria editada exitosamente. ID: {$_POST["idCategoria"]},  CATEGORIA: {$_POST["editarCategoria"]}",
					));

					echo'<script>

					swal({
						  type: "success",
						  title: "La categoría ha sido cambiada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "categorias";

									}
								})

					</script>';

				}


			}else{
				ModeloLogs::mdlRegistrarLogs($tabla_logs, array(
					"etiqueta" => "Categorias Controlador",
					"descripcion" => "Categoria no editada. ID: {$_POST["idCategoria"]},  CATEGORIA: {$_POST["editarCategoria"]}",
				));

				echo'<script>

					swal({
						  type: "error",
						  title: "¡La categoría no puede ir vacía o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "categorias";

							}
						})

			  	</script>';

			}

		}

	}

	/*=============================================
	BORRAR CATEGORIA
	=============================================*/

	static public function ctrBorrarCategoria(){

		if(isset($_GET["idCategoria"])){

			$tabla ="Categorias";
			$datos = $_GET["idCategoria"];
			$tabla_logs = "logs";

			$respuesta = ModeloCategorias::mdlBorrarCategoria($tabla, $datos);

			if($respuesta == "ok"){
				ModeloLogs::mdlRegistrarLogs($tabla_logs, array(
					"etiqueta" => "Categorias Controlador",
					"descripcion" => "Categoria borrada exitosamente. ID: {$_GET["idCategoria"]}",
				));

				echo'<script>

					swal({
						  type: "success",
						  title: "La categoría ha sido borrada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "categorias";

									}
								})

					</script>';
			}
		}
		
	}
}
