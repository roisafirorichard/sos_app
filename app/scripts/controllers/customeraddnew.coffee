'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:CustomeraddnewCtrl
 # @description
 # # CustomeraddnewCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'CustomeraddnewCtrl', ($scope, CustomerService, selects, array)->
	$scope.customers = {}
	$scope.customers.loading = false
	$scope.selects = selects
	#$scope.ks = angular.copy array
	#console.log "ks array", $scope.ks 
	$scope.ks =
		anrede:
			id: 0
			name: '----'
		title:
			id: 0
			name: '----'
		land:
			id: 0
			name: 'Deutschland'
		werbung:
			id: 0
			name: '----'
		bevorzugle:
			id: 0
			name: '----'
		telefonkontakt:
			id: 0
			name: '----'
	angular.extend $scope.ks, array
	$scope.dateOptions =
		changeYear: true
		changeMonth: true
		yearRange: '1900:-0'
	$scope.customers.defaultSettings = 
		'datepicker':
			'value': '1991/07/12'

	$scope.customers.addNewCustomer = (ds) ->
		$scope.customers.loading = true
		console.log ds
		ds.anrede = ds.anrede.id
		ds.title = ds.title.id
		ds.land = ds.land.id
		ds.werbung = ds.werbung.id
		ds.bevorzugle = ds.bevorzugle.id
		ds.telefonkontakt = ds.telefonkontakt.id

		CustomerService.addNewCustomer(ds).then (d) ->
			console.log 'this is the resp: ' + d
			if d.message.messageType == 'ERROR'
				$rootScope.$broadcast 'alertError', d.message
					
				$scope.customers.loading = false
			else
				$scope.customers.customers = d.data
				#$element.modal 'hide'
				#close null, 500

			return
		return
	return
