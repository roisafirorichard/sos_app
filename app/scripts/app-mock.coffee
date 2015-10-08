###*
 # @ngdoc overview
 # @name sosAppApp
 # @description
 # # sosAppApp
 #
 # Main module of the application.
###
angular
    .module 'sosAppAppDev', [
        'sosAppApp',
        'ngMockE2E'
    ]
    .run ($httpBackend) ->
        'use strict'
        $httpBackend.whenGET(/^views\//).passThrough()
        $httpBackend.whenGET(/^resources\//).passThrough()

        ### backend API calls here ###

        $httpBackend.whenPOST(/^\/signup/).respond 200
        $httpBackend.whenGET(/^\/api\/login/).respond 200, TD.login
        $httpBackend.whenPOST(/\/api\/\/exception\/(\S)*/).respond {}
        return
if angular.mock
    angular.element(document).ready ->
        'use strict'
        angular.bootstrap document, [ 'sosAppAppDev' ]
        return