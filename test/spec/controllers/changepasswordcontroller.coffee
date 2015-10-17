'use strict'

describe 'Controller: ChangepasswordcontrollerCtrl', ->

  # load the controller's module
  beforeEach module 'sosAppApp'

  ChangepasswordcontrollerCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ChangepasswordcontrollerCtrl = $controller 'ChangepasswordcontrollerCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ChangepasswordcontrollerCtrl.awesomeThings.length).toBe 3
