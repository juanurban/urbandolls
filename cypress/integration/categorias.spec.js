const login = require('../plugins/login')

describe('Categorias', () => {
    const categoria = "BOLSOS";

    it('Agregar una Categoria', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/categorias')
        cy.get('[data-target="#modalAgregarCategoria"]').click()

        cy.get('[name="nuevaCategoria"]').type(categoria)
        cy.get('#GuardarCategoriaBoton').click()
        cy.get('#swal2-title').contains("La categoría ha sido guardada correctamente")
    });

    it('Listar categorias', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/categorias')
        cy.get('table').contains('th', '#')
        cy.get('table').contains('th', 'Categoria')
        cy.get('table').contains('th', 'Acciones')
    });

    it('Editar categoria', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/categorias')
        cy.get('.paginate_button.next > a').click();
        cy.get('table').contains('tr', categoria).then(row => {
            cy.get(row).find('[data-target="#modalEditarCategoria"]').click();
        });
        cy.get('[name="editarCategoria"]').type(categoria)
        cy.get('#EditarCategoriaBoton').click()
        cy.get('#swal2-title').contains("La categoría ha sido cambiada correctamente")

    });

    it('Eliminar categoria', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/categorias')
        cy.get('.paginate_button.next > a').click();
        cy.get('table').contains('tr', categoria).then(row => {
            cy.get(row).find('.btnEliminarCategoria').click();
        });
        cy.get('.swal2-confirm').contains("Si, borrar categoría!").click()
    });
});
