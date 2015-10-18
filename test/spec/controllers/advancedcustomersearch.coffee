'use strict'

describe 'Controller: AdvancedcustomersearchCtrl', ->

  # load the controller's module
  beforeEach module 'sosAppApp'

  AdvancedcustomersearchCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdvancedcustomersearchCtrl = $controller 'AdvancedcustomersearchCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(AdvancedcustomersearchCtrl.awesomeThings.length).toBe 3
