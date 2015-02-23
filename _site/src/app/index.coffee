angular.module "responsiviewer", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngResource', 'ngRoute', 'mgcrea.ngStrap']
  .config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "app/main/main.html"
        controller: "MainCtrl"
      .otherwise
        redirectTo: "/"
  .config( ($sceDelegateProvider) ->
    $sceDelegateProvider.resourceUrlWhitelist(['self','http://www.uol.com.br/'])
  )

