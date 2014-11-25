@app = angular.module 'sidebar'

@app.controller 'SidebarController', [ '$scope', ($scope) ->
  $scope.openSidebar = true
  $scope.toggle = false
  $scope.completed   = { status: false }
  $scope.snooze      = { status: true }

  $scope.showCompleted = ->
    $scope.completed.status = true
    $scope.snooze.status    = false

  $scope.showSnoozed = ->
    $scope.snooze.status = true
    $scope.completed.status = false

  $scope.toggleDrawer = ->
      $scope.toggle = !$scope.toggle
]
