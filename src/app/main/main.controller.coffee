angular.module "responsiviewer"
  .controller "MainCtrl", ($scope, $sce) ->
    
    $scope.load = (url) ->
      $scope.url = url
    
    $scope.url = 'http://www.aldeiaco.com.br'
    
    return
  .filter 'trustAsResourceUrl', ['$sce', ($sce) ->
      return (val) ->
          return $sce.trustAsResourceUrl(val)
  ]