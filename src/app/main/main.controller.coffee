angular.module "responsiviewer"
  .controller "MainCtrl", ($scope, $sce) ->
    
    $scope.screens = []
    $scope.url = 'http://www.aldeiaco.com.br'

    $scope.screens.push({
      url: $scope.url
    })

    $scope.load = (url) ->
      $scope.url = url
      angular.forEach $scope.screens, (s, s_i) ->
        s.url = $scope.url
      return

    $scope.add = ->
      $scope.screens.push({
        url: $scope.url
      })

    return

  .filter 'trustAsResourceUrl', ['$sce', ($sce) ->
      return (val) ->
          return $sce.trustAsResourceUrl(val)
  ]