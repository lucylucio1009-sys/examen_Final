
Feature: Gestionar usuarios con cabeceras dinamicas
  Background:
    * url baseURL
    * def Util = Java.type('util.Util')
    * def idAleatorio = Util.obtenerIdAleatorio()
    * def requestId = Util.generarRequestIdAleatorio()

  @api-bs-usuarios-cert
  Scenario: Crear usuarios con cabeceras dinamicas
    Given path pathUsuarios
    * header request-ID = requestId
    * print requestId
    * def reqBody = read('data/usuarios_json.json')
    * set reqBody.id = idAleatorio
    * set reqBody.nombre = "Luca Mateo"
    * set reqBody.apellidos = "Verano Lucio"
    And request reqBody
    When method post
    Then status 201
    * print 'Imprimiendo responde', response


  @flujo
  Scenario: Crear y consultar usuarios
    Given path pathUsuarios
    * header request-ID = requestId
    * print requestId
    * def reqBody = read('data/usuarios_json.json')
    * set reqBody.id = idAleatorio
    * set reqBody.nombre = "Luciana Valeria"
    * set reqBody.apellidos = "Pablo Lucio"
    And request reqBody
    When method post
    Then status 201
    * print 'Imprimiendo responde', response


    * eval java.lang.Thread.sleep(2000)
    Given path pathConsultaUsuarios
    * param id = idAleatorio
    When method get
    Then status 200
    * print 'Imprimiendo response', response