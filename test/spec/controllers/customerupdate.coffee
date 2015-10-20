'use strict'

describe 'Controller: CustomerupdateCtrl', ->

  # load the controller's module
  beforeEach module 'sosAppApp'

  CustomerupdateCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CustomerupdateCtrl = $controller 'CustomerupdateCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(CustomerupdateCtrl.awesomeThings.length).toBe 3
