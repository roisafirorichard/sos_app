'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:ChangepasswordcontrollerCtrl
 # @description
 # # ChangepasswordcontrollerCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'Changepasswordcontroller', ($scope, $element, close, authService, ModalService)->
    
	$scope.changePassword = (username, oldpassword, newpassword) ->
		$scope.loading = true

		authService.changePassword(username, oldpassword, newpassword).then (d) ->
			console.log 'this is the resp: ' + d
			if d.message.messageType == 'ERROR'
				ModalService.showModal(
					templateUrl: 'templates/modals/info.html'
					controller: ->
						@info = d.message.desc
						return
					controllerAs: 'infoModal').then (modal) ->
					modal.element.modal()
					return
					
				$scope.loading = false
			else 
				$element.modal 'hide'
				close null, 500

			return
		return
	return
