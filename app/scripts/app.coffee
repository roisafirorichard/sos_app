'use strict'

###*
 # @ngdoc bootstrap
 # @name mockedBackendWithAngularjsApp
 #
###
do ->
  if !angular.mock
    angular.element(document).ready ->
      angular.bootstrap document, [ 'sosAppApp' ]
      return
  return

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
    'tmh.dynamicLocale'
  ]
  .config ($routeProvider, $locationProvider, $translateProvider, tmhDynamicLocaleProvider) ->
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

    # $locationProvider.html5Mode true
    $translateProvider.useMissingTranslationHandlerLog()

    $translateProvider.useStaticFilesLoader
      prefix: 'resources/locale-'
      suffix: '.json'
    $translateProvider.preferredLanguage 'en_US'
    # is applied on first load
    $translateProvider.useLocalStorage()
    # saves selected language to localStorage
    tmhDynamicLocaleProvider.localeLocationPattern 'bower_components/angular-i18n/angular-locale_{{locale}}.js'
  .constant 'LOCALES',
    'locales':
      'ru_RU': 'Русский'
      'en_US': 'English'
    'preferredLocale': 'en_US'
