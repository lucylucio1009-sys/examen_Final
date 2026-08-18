@ignore
Feature: Gestionar usuarios

Scenario: Registrar usuario con el metodo POST
Given url baseURL
Given path pathUsuarios

* def reqBody = read('data/usuarios_json.json')
And set reqBody.id = 11
And set reqBody.nombre = 'Lucy Miriam'
And set reqBody.apellidos = 'Lucio Montes'
And request reqBody
And method post
Then status 201
* print 'imprimir el response data', response
