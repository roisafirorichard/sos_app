'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'LoginCtrl', ($scope, authService, $location) ->
	
	# $scope.username = ''
	# $scope.password = ''

	$scope.login = (username, password) ->
		authService.login().then (d) ->
			console.log "this is the resp: "+d
			$scope.data = d
			$location.path("/home");
			return
