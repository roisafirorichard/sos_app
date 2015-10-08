'use strict'

###*
 # @ngdoc service
 # @name sosAppApp.authService
 # @description
 # # authService
 # Service in the sosAppApp.
###
angular.module 'sosAppApp'
  .factory 'authService', ($http)->

	authService = 
		login: ->
			promise = $http.get('/api/login').then((response) ->
				console.log response
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