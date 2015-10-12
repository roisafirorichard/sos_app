'use strict'

describe 'Directive: LanguageSelectDirective', ->

  # load the directive's module
  beforeEach module 'sosAppApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<-language-select-directive></-language-select-directive>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the LanguageSelectDirective directive'
