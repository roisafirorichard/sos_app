'use strict'

describe 'Service: addressService', ->

  # load the service's module
  beforeEach module 'sosAppApp'

  # instantiate service
  addressService = {}
  beforeEach inject (_addressService_) ->
    addressService = _addressService_

  it 'should do something', ->
    expect(!!addressService).toBe true
