'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'MainCtrl', ($scope, $rootScope,CustomerService, addressService, ModalService, $timeout) ->
	$scope.Custemersearch = {}
	$scope.Custemersearch.customerSelected = false
	$scope.Custemersearch.findCustomerById = (Id) ->
		if !Id
			$scope.Custemersearch.findCustomerModal()
		else 
			CustomerService.getCustomerById(Id).then (d) ->
				if d.message.messageType == "NONE"
					$scope.Custemersearch.data = angular.copy d.data
					$rootScope.$broadcast 'getAddressesForMain', d.data.id
					$scope.Custemersearch.customerSelected = true
				else
					$rootScope.$broadcast 'alertError', d.message
		return

	$scope.Custemersearch.findCustomerModal = ->
		ModalService.showModal(
			templateUrl: 'templates/modals/CustomerSearch.html'
			controller: 'AdvancedcustomersearchCtrl').then (modal) ->
			modal.element.modal()
			modal.close.then (result) ->
				$scope.message = if result then 'You said Yes' else 'You said No'
				return
			return
		return

	$scope.Custemersearch.creatNewCustomer = (ks)->
		ModalService.showModal(
			templateUrl: 'templates/modals/CustomerAddNew.html'
			controller: 'CustomeraddnewCtrl'
			inputs:
				array: ks).then (modal) ->
			modal.element.modal()
			return
		return

	$scope.Custemersearch.updateCustomer = (ks)->
		ModalService.showModal(
			templateUrl: 'templates/modals/CustomerUpdate.html'
			controller: 'CustomerupdateCtrl'
			inputs:
				array: ks).then (modal) ->
			modal.element.modal()
			return
		return

	$scope.Custemersearch.createAddress = (id)->
		ModalService.showModal(
			templateUrl: 'templates/modals/createAddress.html'
			controller: 'CreateaddressCtrl'
			inputs:
				customerId: id).then (modal) ->
			modal.element.modal()
			return
		return

	$scope.Custemersearch.updateAddress = (array, addressId)-> 
		ModalService.showModal(
			templateUrl: 'templates/modals/updateAddress.html'
			controller: 'UpdateaddressCtrl').then (modal) ->
			modal.element.modal()
			return
		return

	$scope.Custemersearch.removeAddress = (customerId, addressId) ->
		addressService.removeAddress(customerId,addressId).then (d)->
			if d.message.messageType == "NONE"
				$rootScope.$broadcast 'alertError', d.message
			else
				$rootScope.$broadcast 'alertError', d.message


	$scope.Custemersearch.addresses = (array, id)->
		ModalService.showModal(
			templateUrl: 'templates/modals/addresses.html'
			controller: 'AddressesCtrl'
			inputs:
				customerId: id).then (modal) ->
			modal.element.modal()
			return
		return

	$scope.alertError = (message) ->
		ModalService.showModal(
			templateUrl: 'templates/modals/info.html'
			controller: ->
				@title = message.msg
				@desc = message.desc
				return
			controllerAs: 'infoModal').then (modal) ->
			modal.element.modal()
			return

	$scope.resetFoundCustomer = ->
		$scope.Custemersearch.data = {}
		if $scope.customer.Id
			$scope.customer.Id = ''
		$scope.Custemersearch.customerSelected = false
		return
	#all events goes here
	$rootScope.$on 'createAddress', (event, customerId) ->
		#console.log data
		$scope.Custemersearch.createAddress customerId
		return

	$rootScope.$on 'updateAddress', (event, array, addressId) ->
		#console.log data
		$scope.Custemersearch.updateAddress array, addressId
		return

	$rootScope.$on 'removeAddress', (event, customerId, addressId) ->
		#console.log data
		$scope.Custemersearch.removeAddress customerId, addressId
		return

	$rootScope.$on 'addresses', (event, array, id) ->
		#console.log data
		$scope.Custemersearch.addresses array, id
		return

	$rootScope.$on 'creatNewCustomer', (event, data) ->
		#console.log data
		$scope.Custemersearch.creatNewCustomer data
		return

	$rootScope.$on 'updateCustomer', (event, data) ->
		#console.log data
		$scope.Custemersearch.updateCustomer data
		return

	$rootScope.$on 'selectCustomer', (event, data) ->
		console.log data
		$scope.Custemersearch.data = angular.copy data
		$scope.Custemersearch.customerSelected = true
		#get all addresses
		$rootScope.$broadcast 'getAddressesForMain', data.id
		return

	$rootScope.$on 'alertError', (event, data) ->
		#console.log data
		$scope.alertError data
		return

	$rootScope.$on 'getAddressesForMain', (event, data) ->
		addressService.getAddressesForCustomerId(data).then (d) ->
			$scope.Custemersearch.addressesData = d.data
			$timeout (->
				if $scope.gridApi.selection.selectRow
					$scope.gridApi.selection.selectRow $scope.gridOptions.data[0]
				return
			), 1
		return

	$('#myTabs a').click (e) ->
		e.preventDefault()
		$(this).tab 'show'
		return

	$('.left-colmn, .right-clmn').height $(window).height() - 90
	$scope.gridOptions =
		modifierKeysToMultiSelectCells: true
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

	$scope.gridOptionsAdr =
		enableRowSelection: true
		enableSelectAll: false
		enableFullRowSelection: true
		selectionRowHeaderWidth: 35
		noUnselect: true
		rowHeight: 35
		multiSelect: false
		showGridFooter:true
		appScopeProvider: 
			onDblClick: (row) ->
				console.log "row data: ", row.entity
				return
			onClickSla: (row) ->
				console.log "SLA is:", row.entity.standardDelivery
		rowTemplate: '<div ng-dblclick="grid.appScope.onDblClick(row)" ng-repeat="(colRenderIndex, col) in colContainer.renderedColumns track by col.colDef.name" class="ui-grid-cell" ng-class="{ \'ui-grid-row-header-cell\': col.isRowHeader }" ui-grid-cell ></div>'
		columnDefs: [
			{
				name: 'standardDelivery'
				cellTemplate: '<div class="ui-grid-cell-contents" ng-click="grid.appScope.onClickSla(row)" title="TOOLTIP">{{grid.appScope.cumulative(grid, row)}}</div>'
			}
			{
				name: 'id'
			}
			{
				name: 'street'
			}
			{
				name: 'zip'
			}
			{ 
				name: 'city'
			}
			{
				name: 'firstname'
			}
		]
		data: 'Custemersearch.addressesData'

	$scope.gridOptionsAdr.onRegisterApi = (gridApi) ->
		#set gridApi on scope
		$scope.gridApi = gridApi
		gridApi.selection.on.rowSelectionChanged $scope, (row) ->
			msg = 'row selected and has: ' 
			console.log msg, row.entity
			return
		gridApi.selection.on.rowSelectionChangedBatch $scope, (rows) ->
			msg = 'rows changed ' + rows.length
			console.log msg
			return
		return
	return
