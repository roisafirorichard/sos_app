'use strict'

###*
 # @ngdoc service
 # @name sosAppApp.addressService
 # @description
 # # addressService
 # Factory in the sosAppApp.
###
angular.module 'sosAppApp'
  .factory 'addressService', ($http, config, $translate) ->
	locale = $translate.use()
	addressService = 
		createAddress: (array) ->
			data =
				'zip': '44444'
				'city': 'Landshut'
				'street': 'Hauptstrasse'
				'houseNumber': '1a'
				'houseNumberAffix': null
				'firstname': 'sepp'
				'lastname': 'meier'
				'nameAffix': null
				'companyAffix': null
				'email': null
				'mobileAreaCode': '0179'
				'mobileNumber': '123456789'
				'privateAreaCode': '089'
				'privateNumber': '987654321'
				'businessAreaCode': null
				'businessNumber': null
				'faxAreaCode': null
				'faxNumber': null
				'titleId': null
				'countryId': 1
				'salutationId': 2

			headers = 
				'systemId': config.systemId
				'userId': config.userId
			promise = $http.post(config.apiUrl + '/SOS-1/1/'+locale+'/address/'+array.customerId , data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		validateAddress: (array) ->
			data =
				'zip': '12345'
				'city': 'Landshut'
				'street': 'Hauptstrasse'
				'houseNumber': '1'
				'houseNumberAffix': null
				'firstname': 'hans'
				'lastname': 'meier'
				'nameAffix': null
				'companyAffix': null
				'email': 'test@test.de'
				'mobileAreaCode': '0179'
				'mobileNumber': '123456789'
				'privateAreaCode': null
				'privateNumber': null
				'businessAreaCode': null
				'businessNumber': null
				'faxAreaCode': null
				'faxNumber': null
				'titleId': null
				'countryId': 1
				'salutationId': 2

			headers = 
				'systemId': config.systemId
				'userId': config.userId

			promise = $http.post(config.apiUrl + '/SOS-1/1/'+locale+'/address/validate', data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		updateAddress: (array, addressId) ->
			data =
				"zip" : "44444"
				"city" : "Landshut"
				"street" : "Hauptstrasse"
				"houseNumber" : "1"
				"houseNumberAffix" : null
				"firstname" : "sepp"
				"lastname" : "meier"
				"nameAffix" : null
				"companyAffix" : null
				"email" : "test@test.de"
				"mobileAreaCode" : "0179"
				"mobileNumber" : "123456789"
				"privateAreaCode" : "089"
				"privateNumber" : "987654321"
				"businessAreaCode" : null
				"businessNumber" : null
				"faxAreaCode" : null
				"faxNumber" : null
				"titleId" : null
				"countryId" : 1
				"salutationId" : 2 

			headers = 
				'systemId': config.systemId
				'userId': config.userId
			promise = $http.put(config.apiUrl + '/SOS-1/1/'+locale+'/address/'+addressId, data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		getAddressesForCustomerId: (customerId) ->

			headers = 
				'systemId': config.systemId
				'userId': config.userId

			promise = $http.get(config.apiUrl + '/SOS-1/1/'+locale+'/address/'+customerId+'/all', {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		setDefaultDelivery: (customerId, addressId) ->

			headers = 
				'systemId': config.systemId
				'userId': config.userId
			promise = $http.put(config.apiUrl + '/SOS-1/1/'+locale+'/address/'+customerId+'/'+addressId+'/default', {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		removeAddress: (customerId, addressId) ->

			headers = 
				'systemId': config.systemId
				'userId': config.userId
			promise = $http.del(config.apiUrl + '/SOS-1/1/'+locale+'/address/'+customerId+'/'+addressId+'/remove', {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		getAddressById: (addressId) ->

			headers = 
				'systemId': config.systemId
				'userId': config.userId
			promise = $http.get(config.apiUrl + '/SOS-1/1/'+locale+'/address/'+addressId, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

	addressService
