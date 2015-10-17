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
    'ui.grid.edit',
    'pascalprecht.translate',
    'tmh.dynamicLocale',
    'angularModalService',
    'ipCookie'
  ]
  .config ($routeProvider, $locationProvider, $translateProvider, tmhDynamicLocaleProvider, $httpProvider) ->
    $routeProvider
      .when '/home',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
        controllerAs: 'login'
      .otherwise
        redirectTo: '/login'

    #$httpProvider.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
    # $locationProvider.html5Mode true
    $translateProvider.useMissingTranslationHandlerLog()

    $translateProvider.useStaticFilesLoader
      prefix: 'resources/locale-'
      suffix: '.json'
    $translateProvider.preferredLanguage 'de_DE'
    # is applied on first load
    $translateProvider.useLocalStorage()
    # saves selected language to localStorage
    tmhDynamicLocaleProvider.localeLocationPattern 'bower_components/angular-i18n/angular-locale_{{locale}}.js'
  
  .constant 'LOCALES',
    'locales':
      'de_DE': 'Deutschland'
      'ch_CH': 'Schweiz'
      'at_AT': 'Österreich'
    'preferredLocale': 'de_DE'
  .constant 'config',
    'appName': 'HSEsos'
    'appVersion': '0.1'
    'apiUrl': 'http://10.197.76.45:80'
    'systemId': 'sosclient'
    'userId': 'sosuser'

