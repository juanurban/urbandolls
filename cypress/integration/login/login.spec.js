describe('Login modulo', () => {
    it('usuario se loguea', () => {
        cy.visit('http://localhost:8080/urbandolls/ingreso')
        cy.get('[name="ingUsuario"]').type('sofiaprzm')
        cy.get('[name="ingPassword"]').type('sena2020')
        cy.get('[type="submit"]').click()

        cy.location('pathname').should('eq', '/urbandolls/inicio')
    });
});