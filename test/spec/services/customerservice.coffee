'use strict'

describe 'Service: CustomerService', ->

  # load the service's module
  beforeEach module 'sosAppApp'

  # instantiate service
  CustomerService = {}
  beforeEach inject (_CustomerService_) ->
    CustomerService = _CustomerService_

  it 'should do something', ->
    expect(!!CustomerService).toBe true
