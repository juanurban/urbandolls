const login = require('../plugins/login')

describe('Clientes', () => {
    const name = "Luis Manrique";
    const documento = 1234567;
    const email = "luis_manr@gmail.com";
    const telefono = "3040000000";
    const direccion = "Avenida 4 #6-87 La Playa";
    const fecha_nacimiento = "19980606";

    it('Agregar un Cliente', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/clientes')
        cy.get('[data-target="#modalAgregarCliente"]').click()

        cy.get('[name="nuevoCliente"]').type(name)
        cy.get('[name="nuevoDocumentoId"]').type(documento)
        cy.get('[name="nuevoEmail"]').type(email)
        cy.get('[name="nuevoTelefono"]').type(telefono)
        cy.get('[name="nuevaDireccion"]').type(direccion)
        cy.get('[name="nuevaFechaNacimiento"]').type(fecha_nacimiento)
        cy.get('#GuardarClienteBoton').click()
        cy.get('#swal2-title').contains("El cliente ha sido guardado correctamente")

    });

    it('Listar clientes', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/clientes')
        cy.get('table').contains('th', 'Nombre')
        cy.get('table').contains('th', 'Documento ID')
        cy.get('table').contains('th', 'Email')
        cy.get('table').contains('th', 'Teléfono')
        cy.get('table').contains('th', 'Dirección')
    });

    it('Editar cliente', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/clientes')
        cy.get('table').contains('tr', name).then(row => {
            cy.get(row).find('[data-target="#modalEditarCliente"]').click();
        });
        cy.get('[name="editarCliente"]').type(name)
        cy.get('[name="editarTelefono"]').type(telefono)
        cy.get('[name="editarDireccion"]').type(direccion)
        cy.get('[name="editarFechaNacimiento"]').type(fecha_nacimiento)
        cy.get('#EditarClienteBoton').click()
        cy.get('#swal2-title').contains("El cliente ha sido cambiado correctamente")

    });

    it('Eliminar cliente', () => {
        login();
        cy.visit('http://localhost:8080/urbandolls/clientes')
        cy.get('table').contains('tr', name).then(row => {
            cy.get(row).find('.btnEliminarCliente').click();
        });
        cy.get('.swal2-confirm').contains("Si, borrar cliente!").click()
        cy.get('#swal2-title').contains("El cliente ha sido borrado correctamente")
    });
});
