'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'MainCtrl', ($scope, CustomerService, ModalService) ->
	$scope.Custemersearch = {}
	$scope.Custemersearch.findCustomerById = (Id) ->
		if !Id
			$scope.Custemersearch.findCustomerModal()
		else 
			CustomerService.getCustomerById(Id).then (d) ->
				if d.message.messageType == "NONE"
					$scope.Custemersearch.data = d.data
				else

		return
	$scope.Custemersearch.findCustomerModal = ->
		ModalService.showModal(
			templateUrl: 'templates/modals/CustomerSearch.html'
			controller: ->
				@info = "something"
			controllerAs: 'infoModal').then (modal) ->
			modal.element.modal()
			modal.close.then (result) ->
				$scope.message = if result then 'You said Yes' else 'You said No'
				return
			return
		return

	$('#myTabs a').click (e) ->
		e.preventDefault()
		$(this).tab 'show'
		return

	$('.left-colmn, .right-clmn').height $(window).height() - 90
	
	$scope.gridOptions =
		enableSorting: true
		columnDefs: [
			{
				name: 'column1'
				field: 'first-name'
			}
			{
				name: 'column2'
				field: 'friends[0]'
			}
			{
				name: 'column3'
				field: 'address.city'
			}
			{
				name: 'column4'
				field: 'getZip()'
				enableCellEdit: false
			}
		]
		data: [
			{
				'first-name': 'Lorem'
				'friends': [ 'Lorem' ]
				'address':
					street: '301 Dove Ave'
					city: 'Casablanca'
					zip: '20640'
				'getZip': ->
					@address.zip

			}
			{
				'first-name': 'Lorem'
				'friends': [ 'Lorem' ]
				'address':
					street: '301 Dove Ave'
					city: 'Casablanca'
					zip: '20640'
				'getZip': ->
					@address.zip

			}
			{
				'first-name': 'Lorem'
				'friends': [ 'Lorem' ]
				'address':
					street: '301 Dove Ave'
					city: 'Casablanca'
					zip: '20640'
				'getZip': ->
					@address.zip

			}
		]
	return
