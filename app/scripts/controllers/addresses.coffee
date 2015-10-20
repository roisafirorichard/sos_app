'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:AddressesCtrl
 # @description
 # # AddressesCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'AddressesCtrl', ($scope, $rootScope, customerId)->
	#get addresses getAddressesForCustomerId

	#create new Addresses
	$scope.updateAddress = () ->
		$rootScope.$broadcast 'creatAddress', customerId
	#update adresses
	$scope.updateAddress = (addressId, array) ->
		$rootScope.$broadcast 'updateAddress', array

	$scope.removeAddress = (addressId) ->
		$rootScope.$broadcast 'removeAddress', customerId, addressId