const login = require('../plugins/login')

describe('Productos', () => {
    const descripcion = "Blusa animal print";
    const stock = 10;
    const precio_compra = 28000;

    it('Agregar un Producto', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/productos')
        cy.get('[data-target="#modalAgregarProducto"]').click()

        cy.get('[name="nuevaCategoria"]').select("Blusas y camisas")
        cy.get('[name="nuevaDescripcion"]').type(descripcion)
        cy.get('[name="nuevoStock"]').type(stock)
        cy.get('[name="nuevoPrecioCompra"]').type(precio_compra)
        cy.get('#GuardarProductoBoton').click()
        cy.get('#swal2-title').contains("El producto ha sido guardado correctamente")

    });

    it('Listar productos', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/productos')
        cy.get('table').contains('th', 'Imagen')
        cy.get('table').contains('th', 'Código')
        cy.get('table').contains('th', 'Descripción')
        cy.get('table').contains('th', 'Categoría')
        cy.get('table').contains('th', 'Stock')
    });

    it('Editar producto', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/productos')
        cy.get('table').contains('tr', descripcion).then(row => {
            cy.get(row).find('[data-target="#modalEditarProducto"]').click();
        });
        cy.get('[name="editarDescripcion"]').type(descripcion)
        cy.get('[name="editarStock"]').type(stock)
        cy.get('[name="editarPrecioCompra"]').type(precio_compra)
        cy.get('#EditarProductoBoton').click()
        cy.get('#swal2-title').contains("El producto ha sido editado correctamente")

    });

    it('Eliminar producto', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/productos')
        cy.get('table').contains('tr', descripcion).then(row => {
            cy.get(row).find('.btnEliminarProducto').click();
        });
        cy.get('.swal2-confirm').contains("Si, borrar producto!").click()
        cy.get('#swal2-title').contains("El producto ha sido borrado correctamente")
    });
});
