const login = require('../plugins/login')

describe('Ventas', () => {
    const impuesto = 12;
    const valor = 150000;


    it('Listar ventas', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/ventas')
        cy.get('table').contains('th', 'Código factura')
        cy.get('table').contains('th', 'Cliente')
        cy.get('table').contains('th', 'Vendedor')
        cy.get('table').contains('th', 'Forma de pago')
    });

    it('Agregar una Venta', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/crear-venta')

        cy.get('[name="seleccionarCliente"]').select("Lina Mantilla")
        cy.get('[idproducto="34"]').click()
        cy.get('[idproducto="29"]').click()
        cy.get('[idproducto="27"]').click()
        cy.get('[name="nuevoMetodoPago"]').select("Efectivo")
        
        cy.get('[name="nuevoImpuestoVenta"]').type(impuesto)
        cy.get('[id="nuevoValorEfectivo"]').type(valor)
        cy.get('#GuardarVentaBoton').click()
        cy.get('#swal2-title').contains("La venta ha sido guardada correctamente")

    });


    it('Editar venta', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/ventas')
        cy.get('[data-test="BotonEditarVenta"]').last().click()
        cy.get('[name="seleccionarCliente"]').select("Lina Suarez")
        cy.get('[name="nuevoMetodoPago"]').select("Efectivo") 
        cy.get('[name="nuevoImpuestoVenta"]').type(impuesto)
        cy.get('[id="nuevoValorEfectivo"]').type(valor)
        cy.get('#EditarVentaBoton').click()
        cy.get('#swal2-title').contains("La venta ha sido editada correctamente")
    });

    it('Eliminar venta', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/ventas')
        cy.get('[data-test="BotonEliminarVenta"]').last().click()
        cy.get('.swal2-confirm').contains("Si, borrar venta!").click()
        cy.get('#swal2-title').contains("La venta ha sido borrada correctamente")

    });


});