'use strict'

###*
 # @ngdoc service
 # @name sosAppApp.CustomerService
 # @description
 # # CustomerService
 # Factory in the sosAppApp.
###
angular.module 'sosAppApp'
  .factory 'CustomerService', ($http, $location, $translate, config)->
	locale = $translate.use()
	
	CustomerService = 
		getCustomerById: (Id) ->

			headers = 
				'systemId': config.systemId
				'userId': config.userId

			promise = $http.get(config.apiUrl + '/SOS-1/1/'+locale+'/customer/search/'+Id+'/complete', {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		advancedCustomerSearch: (array) ->
			data = 
				"displayId" : null
				"firstname" : array.vorname
				"lastname" : array.name
				"street" : array.strase
				"houseNumber" : null
				"houseAffixNumber" : null
				"zip" : null
				"city" : null
				"birthday" : null
				"email" : array.email
				"privateAreaCode" : array.telefonprvAreaCode
				"privateNumber" : array.telefonprv
				"countryId" : array.land
				"salutationId" : null
				"titleId" : null

			headers = 
				'systemId': config.systemId
				'userId': config.userId

			promise = $http.post(config.apiUrl + '/SOS-1/1/'+locale+'/customer/search', data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		addNewCustomer: (array) ->
			data = 
				'birthday': array.dateofbirth
				'firstname': array.vorname
				'lastname': array.name
				'sendPromotesFlg': array.werbung
				'phoneContactId': array.telefonkontakt
				'paymentId': array.bevorzugle
				'titleId': array.title
				'salutationId': array.anrede
				'masterAddress':
					'zip': '81549'
					'city': 'Stadelheim'
					'street': array.strase
					'houseNumber': array.hnr
					'houseNumberAffix': null
					'firstname': array.vorname
					'lastname': array.name
					'nameAffix': null
					'companyAffix': null
					'email': array.email
					'mobileAreaCode': array.telefonmobilAreaCode
					'mobileNumber': array.telefonmobil
					'privateAreaCode': array.telefonprvAreaCode
					'privateNumber': array.telefonprv
					'businessAreaCode': array.telefondienstAreaCode
					'businessNumber': array.telefondienst
					'faxAreaCode': array.faxAreaCode
					'faxNumber': array.fax
					'titleId': array.title
					'countryId': array.land
					'salutationId': array.anrede

			headers = 
				'systemId': config.systemId
				'userId': config.userId

			promise = $http.post(config.apiUrl + '/SOS-1/1/'+locale+'/customer', data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		updateCustomer: (array, customerId) ->
			data = 
				'birthday': array.dateofbirth
				'firstname': array.vorname
				'lastname': array.name
				'sendPromotesFlg': array.werbung
				'phoneContactId': array.telefonkontakt
				'paymentId': array.bevorzugle
				'titleId': array.title
				'salutationId': array.anrede
				'masterAddress':
					'zip': '81549'
					'city': 'Stadelheim'
					'street': array.strase
					'houseNumber': array.hnr
					'houseNumberAffix': null
					'firstname': array.vorname
					'lastname': array.name
					'nameAffix': null
					'companyAffix': null
					'email': array.email
					'mobileAreaCode': array.telefonmobilAreaCode
					'mobileNumber': array.telefonmobil
					'privateAreaCode': array.telefonprvAreaCode
					'privateNumber': array.telefonprv
					'businessAreaCode': array.telefondienstAreaCode
					'businessNumber': array.telefondienst
					'faxAreaCode': array.faxAreaCode
					'faxNumber': array.fax
					'titleId': array.title
					'countryId': array.land
					'salutationId': array.anrede

			headers = 
				'systemId': config.systemId
				'userId': config.userId

			promise = $http.put(config.apiUrl + '/SOS-1/1/'+locale+'/customer/'+customerId, data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

		validateCustomer: (array) ->
			data = 
				'birthday': array.dateofbirth
				'firstname': array.vorname
				'lastname': array.name
				'sendPromotesFlg': array.werbung
				'phoneContactId': array.telefonkontakt
				'paymentId': array.bevorzugle
				'titleId': array.title
				'salutationId': array.anrede
				'masterAddress':
					'zip': '81549'
					'city': 'Stadelheim'
					'street': array.strase
					'houseNumber': array.hnr
					'houseNumberAffix': null
					'firstname': array.vorname
					'lastname': array.name
					'nameAffix': null
					'companyAffix': null
					'email': array.email
					'mobileAreaCode': array.telefonmobilAreaCode
					'mobileNumber': array.telefonmobil
					'privateAreaCode': array.telefonprvAreaCode
					'privateNumber': array.telefonprv
					'businessAreaCode': array.telefondienstAreaCode
					'businessNumber': array.telefondienst
					'faxAreaCode': array.faxAreaCode
					'faxNumber': array.fax
					'titleId': array.title
					'countryId': array.land
					'salutationId': array.anrede

			headers = 
				'systemId': config.systemId
				'userId': config.userId

			promise = $http.post(config.apiUrl + '/SOS-1/1/'+locale+'/customer/validate', data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise

	CustomerService
