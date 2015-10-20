'use strict'

describe 'Controller: CreateaddressCtrl', ->

  # load the controller's module
  beforeEach module 'sosAppApp'

  CreateaddressCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CreateaddressCtrl = $controller 'CreateaddressCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(CreateaddressCtrl.awesomeThings.length).toBe 3
