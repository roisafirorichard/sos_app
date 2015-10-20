'use strict'

describe 'Controller: UpdateaddressCtrl', ->

  # load the controller's module
  beforeEach module 'sosAppApp'

  UpdateaddressCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    UpdateaddressCtrl = $controller 'UpdateaddressCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(UpdateaddressCtrl.awesomeThings.length).toBe 3
