'use strict'

describe 'Controller: CustomeraddnewCtrl', ->

  # load the controller's module
  beforeEach module 'sosAppApp'

  CustomeraddnewCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CustomeraddnewCtrl = $controller 'CustomeraddnewCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(CustomeraddnewCtrl.awesomeThings.length).toBe 3
