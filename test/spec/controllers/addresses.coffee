'use strict'

describe 'Controller: AddressesCtrl', ->

  # load the controller's module
  beforeEach module 'sosAppApp'

  AddressesCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AddressesCtrl = $controller 'AddressesCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(AddressesCtrl.awesomeThings.length).toBe 3
