'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:AdvancedcustomersearchCtrl
 # @description
 # # AdvancedcustomersearchCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'AdvancedcustomersearchCtrl', ($scope, $rootScope, CustomerService, selects, $timeout,$element,close)->
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
		enableRowSelection: true
		enableSelectAll: false
		enableFullRowSelection: true
		selectionRowHeaderWidth: 35
		noUnselect: true
		rowHeight: 35
		multiSelect: false
		showGridFooter:true
		appScopeProvider: onDblClick: (row) ->
			console.log "row data: ", row.entity
			$scope.searchCustomers.selectedCustomer = row.entity
			$scope.searchCustomers.selectCustomer()
			#close modal
			$element.modal 'hide'
			close null, 500
			return
		rowTemplate: '<div ng-dblclick="grid.appScope.onDblClick(row)" ng-repeat="(colRenderIndex, col) in colContainer.renderedColumns track by col.colDef.name" class="ui-grid-cell" ng-class="{ \'ui-grid-row-header-cell\': col.isRowHeader }" ui-grid-cell ></div>'
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
				$rootScope.$broadcast 'alertError', d.message
					
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
		$rootScope.$broadcast 'creatNewCustomer', ks
		return

	$scope.gridOptions.onRegisterApi = (gridApi) ->
		#set gridApi on scope
		$scope.gridApi = gridApi
		gridApi.selection.on.rowSelectionChanged $scope, (row) ->
			msg = 'row selected and has: ' 
			console.log msg, row.entity
			$scope.searchCustomers.selectedCustomer = row.entity
			return
		gridApi.selection.on.rowSelectionChangedBatch $scope, (rows) ->
			msg = 'rows changed ' + rows.length
			console.log msg
			return
		return
	$scope.searchCustomers.selectCustomer = () ->
		$rootScope.$broadcast 'selectCustomer', $scope.searchCustomers.selectedCustomer
		$element.modal 'hide'
		close null, 500
		return
	$scope.reset()
