'use strict'

###*
 # @ngdoc service
 # @name sosAppApp.LocaleService
 # @description
 # # LocaleService
 # Service in the sosAppApp.
###
angular.module 'sosAppApp'
  .service 'LocaleService', ($translate, LOCALES, $rootScope, tmhDynamicLocale) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
	# PREPARING LOCALES INFO
	localesObj = LOCALES.locales
	# locales and locales display names
	_LOCALES = Object.keys(localesObj)
	if !_LOCALES or _LOCALES.length == 0
		console.error 'There are no _LOCALES provided'
	_LOCALES_DISPLAY_NAMES = []
	_LOCALES.forEach (locale) ->
		_LOCALES_DISPLAY_NAMES.push localesObj[locale]
		return
	# STORING CURRENT LOCALE
	currentLocale = $translate.proposedLanguage()
	# because of async loading
	# METHODS

	checkLocaleIsValid = (locale) ->
		_LOCALES.indexOf(locale) != -1

	setLocale = (locale) ->
		if !checkLocaleIsValid(locale)
			console.error 'Locale name "' + locale + '" is invalid'
			return
		currentLocale = locale
		# updating current locale
		# asking angular-translate to load and apply proper translations
		$translate.use locale
		return

	# EVENTS
	# on successful applying translations by angular-translate
	$rootScope.$on '$translateChangeSuccess', (event, data) ->
		document.documentElement.setAttribute 'lang', data.language
		# sets "lang" attribute to html
		# asking angular-dynamic-locale to load and apply proper AngularJS $locale setting
		tmhDynamicLocale.set data.language.toLowerCase().replace(/_/g, '-')
		return
	{
	getLocaleDisplayName: ->
		localesObj[currentLocale]
	setLocaleByDisplayName: (localeDisplayName) ->
		setLocale _LOCALES[_LOCALES_DISPLAY_NAMES.indexOf(localeDisplayName)]
		return
	getLocalesDisplayNames: ->
		_LOCALES_DISPLAY_NAMES

	}