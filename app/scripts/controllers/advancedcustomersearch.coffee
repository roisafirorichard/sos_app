'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:AdvancedcustomersearchCtrl
 # @description
 # # AdvancedcustomersearchCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'AdvancedcustomersearchCtrl', ($scope, CustomerService, ModalService, selects, $timeout)->
	$scope.searchCustomers = {}
	$scope.searchCustomers.loading = false
	$scope.selects = selects
	$scope.master = {}

	$scope.getCurrentSelection = ->
		values = []
		currentSelection = $scope.gridApi.cellNav.getCurrentSelection()
		i = 0
		while i < currentSelection.length
			values.push currentSelection[i].row.entity[currentSelection[i].col.name]
			i++
		$scope.printSelection = values.toString()
		return

	$scope.gridOptions =
		enableRowSelection: true,
		enableSelectAll: true,
		enableFullRowSelection: true,
		selectionRowHeaderWidth: 35,
		rowHeight: 35,
		showGridFooter:true
		columnDefs: [
			{
				name: 'id'
			}
			{
				name: 'firstname'
			}
			{
				name: 'lastname'
			}
			{ 
				name: 'birthday'
			}
			{
				name: 'masterAddress.city'
			}
		]
		data: 'searchCustomers.customers'

	$scope.reset = ->
		$scope.ks = angular.copy $scope.master
		if $scope.searchCustomers.customers
			$scope.searchCustomers.customers.length=0
		return

	$scope.searchCustomers.search = (array) ->
		console.log "I'm in"
		$scope.searchCustomers.loading = true
		CustomerService.advancedCustomerSearch(array).then (d) ->
			console.log 'this is the resp: ', d
			if d.message.messageType == 'ERROR'
				ModalService.showModal(
					templateUrl: 'templates/modals/info.html'
					controller: ->
						@info = d.message.desc
						return
					controllerAs: 'infoModal').then (modal) ->
					modal.element.modal()
					return
					
				$scope.searchCustomers.loading = false
			else
				$scope.searchCustomers.customers = d.data
				$timeout (->
					if $scope.gridApi.selection.selectRow
						$scope.gridApi.selection.selectRow $scope.gridOptions.data[0]
					return
				), 1
				#$element.modal 'hide'
				#close null, 500

			return
		return
	$scope.searchCustomers.creatNewCustomer = (ks) ->
		ModalService.showModal(
			templateUrl: 'templates/modals/CustomerAddNew.html'
			controller: 'CustomeraddnewCtrl'
			inputs:
				array: ks).then (modal) ->
			modal.element.modal()
			modal.close.then (result) ->
				$scope.message = if result then 'You said Yes' else 'You said No'
				return
			return
		return

	$scope.gridOptions.onRegisterApi = (gridApi) ->
		#set gridApi on scope
		$scope.gridApi = gridApi
		gridApi.selection.on.rowSelectionChanged $scope, (row) ->
			msg = 'row selected ' + row.isSelected
			console.log msg
			return
		gridApi.selection.on.rowSelectionChangedBatch $scope, (rows) ->
			msg = 'rows changed ' + rows.length
			console.log msg
			return
		return
	$scope.reset()
