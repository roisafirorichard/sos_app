'use strict'

describe 'Service: bankAccountService', ->

  # load the service's module
  beforeEach module 'sosAppApp'

  # instantiate service
  bankAccountService = {}
  beforeEach inject (_bankAccountService_) ->
    bankAccountService = _bankAccountService_

  it 'should do something', ->
    expect(!!bankAccountService).toBe true
