const login = require('../plugins/login')

describe('Usuarios', () => {
    const name = "María José Rodríguez";
    const user = "majorodriguez";
    const password = "sena2020majo";

    it('Agregar un usuario', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/usuarios')
        cy.get('[data-target="#modalAgregarUsuario"]').click()

        cy.get('[name="nuevoNombre"]').type(name)
        cy.get('[name="nuevoUsuario"]').type(user)
        cy.get('[name="nuevoPassword"]').type(password)
        cy.get('[name="nuevoPerfil"]').select("Especial")
        cy.get('#GuardarUsuarioBoton').click()

        cy.get('#swal2-title').contains("¡El usuario ha sido guardado correctamente!")
    });

    it('Listar usuarios', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/usuarios')
        cy.get('table').contains('th', 'Nombre')
        cy.get('table').contains('th', 'Usuario')
        cy.get('table').contains('th', 'Foto')
        cy.get('table').contains('th', 'Perfil')
        cy.get('table').contains('th', 'Estado')
    });

    it('Editar usuario', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/usuarios')
        cy.get('table').contains('tr', name).then(row => {
            cy.get(row).find('[data-target="#modalEditarUsuario"]').click();
        });
        cy.get('[name="editarNombre"]').type(name)
        cy.get('[name="editarPassword"]').type(password)
        cy.get('[name="editarPerfil"]').select("Especial")
        cy.get('#EditarUsuarioBoton').click()
    });

    it('Eliminar usuario', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/usuarios')
        cy.get('table').contains('tr', name).then(row => {
            cy.get(row).find('.btnEliminarUsuario').click();
        });
        cy.get('.swal2-confirm').contains("Si, borrar usuario!").click()
        cy.get('#swal2-title').contains("El usuario ha sido borrado correctamente")
    });
});