'use strict'

###*
 # @ngdoc function
 # @name sosAppApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the sosAppApp
###
angular.module 'sosAppApp'
  .controller 'LoginCtrl', ($scope, authService, $location, config, ModalService) ->
	$scope.loading = false
	$scope.login = (username, password) ->
		$scope.loading = true
		authService.login(username, password).then (d) ->
			if d.data == true
				$location.path 'home'
			else
				ModalService.showModal(
					templateUrl: 'templates/modals/info.html'
					controller: ->
						console.log "I'm in"
						@info = d.message.desc
					controllerAs: 'infoModal').then (modal) ->
					modal.element.modal()
					modal.close.then (result) ->
						$scope.message = if result then 'You said Yes' else 'You said No'
						return
					return
			$scope.loading = false
			return
		authService.extandLoginSession(username)
		return

	$scope.changePasswordModal = ->
		ModalService.showModal(
			templateUrl: 'templates/modals/changePassword.html'
			controller : "Changepasswordcontroller").then (modal) ->
			modal.element.modal()
			modal.close.then (result) ->
				$scope.message = if result then 'You said Yes' else 'You said No'
				return
			return
	return
			
