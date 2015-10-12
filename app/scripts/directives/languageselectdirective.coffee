'use strict'

###*
 # @ngdoc directive
 # @name sosAppApp.directive:LanguageSelectDirective
 # @description
 # # LanguageSelectDirective
###
angular.module 'sosAppApp'
  .directive 'ngTranslateLanguageSelect', (LocaleService) ->
	{
		restrict: 'A'
		replace: true
		template: '' + '<form class="form-inline"><div class="language-select form-group" ng-if="visible">' + '<label>' + '{{"directives.language-select.Language" | translate}}:' + '<select class="form-control" ng-model="currentLocaleDisplayName"' + 'ng-options="localesDisplayName for localesDisplayName in localesDisplayNames"' + 'ng-change="changeLanguage(currentLocaleDisplayName)">' + '</select>' + '</label>' + '</div>' + '</form>'
		controller: ($scope) ->
			$scope.currentLocaleDisplayName = LocaleService.getLocaleDisplayName()
			$scope.localesDisplayNames = LocaleService.getLocalesDisplayNames()
			$scope.visible = $scope.localesDisplayNames and $scope.localesDisplayNames.length > 1

			$scope.changeLanguage = (locale) ->
				LocaleService.setLocaleByDisplayName locale
				return

			return

	}
