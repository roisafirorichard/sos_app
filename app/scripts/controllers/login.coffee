'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'LoginCtrl', ($scope, authService, $location, config) ->
	
	$scope.error = false
	$scope.errorMsg = ''
	$scope.loading = false
	$scope.login = (username, password) ->
		$scope.loading = true
		authService.login(username, password).then (d) ->
			if d.data == true
				$location.path 'home'
			else
				$scope.error = true
				$scope.errorMsg = 'Error'
			$scope.loading = false
			return
		return

	$scope.changePassword = (username, oldpassword, newpassword) ->
		$scope.loading = true
		authService.changePassword(username, oldpassword, newpassword).then (d) ->
			console.log 'this is the resp: ' + d
			return
		return

	return
			
