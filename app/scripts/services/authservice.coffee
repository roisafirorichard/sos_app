'use strict'

###*
 # @ngdoc service
 # @name sosAppApp.authService
 # @description
 # # authService
 # Service in the sosAppApp.
###
angular.module 'sosAppApp'
  .factory 'authService', ($http, $translate, config)->
	locale = $translate.use()
	
	authService = 
		login: (username, password)->
			data =
				'username': username
				'password': password

			headers = 
				'systemId': config.systemId
				'userId': config.userId
			promise = $http.post(config.apiUrl + '/SOS-1/1/'+locale+'/agentlogin', data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise
			
		changePassword: (username, oldpassword, newpassword)->
			data =
				'oldPassword': oldpassword
				'newPassword': newpassword

			headers = 
				'systemId': config.systemId
				'userId': config.userId
			promise = $http.put(config.apiUrl + '/SOS-1/1/'+locale+'/agentlogin/'+username, data, {headers: headers}).then((response) ->
				response.data
			)
			# Return the promise to the controller
			promise
	authService

	# AngularJS will instantiate a singleton by calling "new" on this function
	#$http.get('/api/catalog/US').success (data) ->
	#	$scope.key = data.key
	#	return
	
	#$http(
	#	method: 'GET'
	#	url: '/api/catalog/US').success((data) ->
	#	console.log 'pass'
	#	$scope.heading = data
	#	return
	#).error (data) ->
	#	console.log 'failed'
	#	return