'use strict'

describe 'Service: LocaleService', ->

  # load the service's module
  beforeEach module 'sosAppApp'

  # instantiate service
  LocaleService = {}
  beforeEach inject (_LocaleService_) ->
    LocaleService = _LocaleService_

  it 'should do something', ->
    expect(!!LocaleService).toBe true
