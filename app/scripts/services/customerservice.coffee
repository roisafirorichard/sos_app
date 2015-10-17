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
	# Service logic
	# ...
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

	CustomerService
