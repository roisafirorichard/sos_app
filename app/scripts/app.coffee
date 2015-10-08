'use strict'

###*
 # @ngdoc overview
 # @name sosAppApp
 # @description
 # # sosAppApp
 #
 # Main module of the application.
###
angular
  .module 'sosAppApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'cfp.hotkeys',
    'ui.grid', 
    'ui.grid.edit'
  ]
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true

