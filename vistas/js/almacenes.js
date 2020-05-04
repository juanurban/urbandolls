/*=============================================
EDITAR ALMACEN
=============================================*/
$(".tablas").on("click", ".btnEditarAlmacen", function(){

	var idAlmacen = $(this).attr("idAlmacen");

	var datos = new FormData();
    datos.append("idAlmacen", idAlmacen);

    $.ajax({

      url:"ajax/almacenes.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

      	$("#idAlmacen").val(respuesta["id"]);
	       $("#editarAlmacen").val(respuesta["nombre"]);
	       $("#editarTelefono").val(respuesta["telefono"]);
	       $("#editarDireccion").val(respuesta["direccion"]);
	  }

  	})

})

/*=============================================
ELIMINAR ALMACEN
=============================================*/
$(".tablas").on("click", ".btnEliminarAlmacen", function(){

	var idAlmacen = $(this).attr("idAlmacen");
	
	swal({
        title: '¿Está seguro de borrar el almacén?',
        text: "¡Si no lo está puede cancelar la acción!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar almacén'
      }).then(function(result){
        if (result.value) {
          window.location = "index.php?ruta=almacenes&idAlmacen="+idAlmacen;
        }

  })

})