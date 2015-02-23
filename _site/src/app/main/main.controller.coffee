angular.module "responsiviewer"
  .controller "MainCtrl", ($scope, $sce, $interval) ->
    
    timer = ''
    $scope.screens = []
    $scope.url = 'http://www.aldeiaco.com.br'

    $scope.screens.push({
      url: $scope.url
    })

    $scope.dropdown = [
      {
        "text": "none",
        "click": "refresh(0)"
      },
      {
        "text": "5s",
        "click": "refresh(5)"
      },
      {
        "text": "10s",
        "click": "refresh(10)"
      },
      {
        "text": "15s",
        "click": "refresh(15)"
      }
    ]

    $scope.refresh = (t) ->

      timer = $interval( -> 
        $scope.load($scope.url)
        return
      t * 1000)

      if t == 0
        $interval.cancel(timer)

      return
    
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