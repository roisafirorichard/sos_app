'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:CreateaddressCtrl
 # @description
 # # CreateaddressCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'CreateaddressCtrl', ($scope, customerId, addressService, selects) ->
	$scope.selects = angular.copy selects

	$scope.address =
		anrede:
			id: 0
			name: '----'
		title:
			id: 0
			name: '----'
	
	$scope.createAddress = (array) ->
		addressService.createAddress(array).then (d) ->
			console.log 'this is the resp: ', d
			if d.message.messageType == 'ERROR'
				$rootScope.$broadcast 'alertError', d.message
