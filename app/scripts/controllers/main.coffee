'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'MainCtrl', ($scope) ->
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
