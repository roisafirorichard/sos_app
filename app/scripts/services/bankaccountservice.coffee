'use strict'

###*
 # @ngdoc service
 # @name sosAppApp.bankAccountService
 # @description
 # # bankAccountService
 # Factory in the sosAppApp.
###
angular.module 'sosAppApp'
  .factory 'bankAccountService', (config, $translate)->
	locale = $translate.use()

	bankAccountService = 
		create: (array, customerId) ->
			data =
				'holderName': ''
				'accountNumber': 12345678
				'bankCode': 111222333
				'bankName': 'suppa duppa bank'
				'ibanCountryCode': ''
				'ibanChecksum': ''
				'ibanAccountNumber': ''
				'ibanBankCode': ''

			headers = 
				'systemId': config.systemId
				'username': config.userId
			promise = $http.post(config.apiUrl + '/SOS-1/1/'+locale+'/bankaccount/'+customerId , data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		update: (array, customerId, bankaccountId) ->
			data =
				'holderName': 'helmut Zagler'
				'accountNumber': 12345678
				'bankCode': 111111111
				'bankName': 'suppa duppa bank'
				'ibanCountryCode': ''
				'ibanChecksum': ''
				'ibanAccountNumber': ''
				'ibanBankCode': ''

			headers = 
				'systemId': config.systemId
				'username': config.userId
			promise = $http.put(config.apiUrl + '/SOS-1/1/'+locale+'/bankaccount/'+customerId+'/'+bankaccountId , data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		getBankAccount: (customerId) ->
			headers = 
				'systemId': config.systemId
				'username': config.userId
			promise = $http.get(config.apiUrl + '/SOS-1/1/'+locale+'/bankaccount/'+ customerId , {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		checkForDelete: (customerId) ->
			headers = 
				'systemId': config.systemId
				'username': config.userId
			promise = $http.get(config.apiUrl + '/SOS-1/1/'+locale+'/bankaccount/'+customerId+'/check' , {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		delete: (customerId, bankaccountId) ->

			headers = 
				'systemId': config.systemId
				'username': config.userId
			promise = $http.del(config.apiUrl + '/SOS-1/1/'+locale+'/bankaccount/'+customerId+'/'+bankaccountId , {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

	bankAccountService
