const login = require('../../plugins/login')

describe('Dashboard', () => {
    it('Elementos del panel de control', () => {
        login();
        cy.get('#CajasSuperiores').find('.small-box').should('have.length', 4)
        cy.get('#GraficoVentas').should('exist')
        cy.get('#ProductosMasVendidos').should('exist')
        cy.get('#ProductosRecientes').should('exist')
    });

    it('Redireccion caja ventas', () => {
        login();
        cy.get("#CajaVentas").click();
        cy.location('pathname').should('eq', '/urbandolls/ventas')
    });

    it('Redireccion caja categorias', () => {
        login();
        cy.get("#CajaCategorias").click();
        cy.location('pathname').should('eq', '/urbandolls/categorias')
    });

    it('Redireccion caja clientes', () => {
        login();
        cy.get("#CajaClientes").click();
        cy.location('pathname').should('eq', '/urbandolls/clientes')
    });

    it('Redireccion caja productos', () => {
        login();
        cy.get("#CajaProductos").click();
        cy.location('pathname').should('eq', '/urbandolls/productos')
    });
});