<?php

class ControladorAlmacenes{

	/*=============================================
	CREAR ALMACENES
	=============================================*/

	static public function ctrCrearAlmacen(){

		if(isset($_POST["nuevoAlmacen"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúüÁÉÍÓÚ ]+$/', $_POST["nuevoAlmacen"]) &&
			   preg_match('/^[()\-0-9 ]+$/', $_POST["nuevoTelefono"]) && 
               preg_match('/^[#\.\-a-zA-Z0-9ñÑáéíóúüÁÉÍÓÚ ]+$/', $_POST["nuevaDireccion"])){

			   	$tabla = "almacenes";

			   	$datos = array("nombre"=>$_POST["nuevoAlmacen"],
					           "telefono"=>$_POST["nuevoTelefono"],
					           "direccion"=>$_POST["nuevaDireccion"]);

                $respuesta = ModeloAlmacenes::mdlIngresarAlmacen($tabla, $datos);

			   	if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El almacén ha sido guardado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "almacenes";

									}
								})

					</script>';

				}

			}else{

				echo'<script>

					swal({
						  type: "error",
						  title: "¡El almacén no puede ir vacío o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "almacenes";

							}
						})

			  	</script>';



			}

		}

	}

	/*=============================================
	MOSTRAR ALMACENES
	=============================================*/

	static public function ctrMostrarAlmacenes($item, $valor){

		$tabla = "almacenes";

		$respuesta = ModeloAlmacenes::mdlMostrarAlmacenes($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	EDITAR ALMACEN
	=============================================*/

	static public function ctrEditarAlmacen(){

		if(isset($_POST["editarAlmacen"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarAlmacen"]) && 
			   preg_match('/^[()\-0-9 ]+$/', $_POST["editarTelefono"]) && 
			   preg_match('/^[#\.\-a-zA-Z0-9ñÑáéíóúüÁÉÍÓÚ ]+$/', $_POST["editarDireccion"])){

			   	$tabla = "almacenes";

			   	$datos = array("id"=>$_POST["idAlmacen"],
			   				   "nombre"=>$_POST["editarAlmacen"],
					           "telefono"=>$_POST["editarTelefono"],
					           "direccion"=>$_POST["editarDireccion"]);

			   	$respuesta = ModeloAlmacenes::mdlEditarAlmacen($tabla, $datos);

			   	if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El almacén ha sido cambiado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "almacenes";

									}
								})

					</script>';

				}

			}else{

				echo'<script>

					swal({
						  type: "error",
						  title: "¡El almacén no puede ir vacío o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "almacenes";

							}
						})

			  	</script>';



			}

		}

	}

	/*=============================================
	ELIMINAR ALMACEN
	=============================================*/

	static public function ctrEliminarAlmacen(){

		if(isset($_GET["idAlmacen"])){

			$tabla ="almacenes";
			$datos = $_GET["idAlmacen"];

			$respuesta = ModeloAlmacenes::mdlEliminarAlmacen($tabla, $datos);

			if($respuesta == "ok"){

				echo'<script>

				swal({
					  type: "success",
					  title: "El almacén ha sido borrado correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "almacenes";

								}
							})

				</script>';

			}		

		}

	}

}
