@app = angular.module 'goals'

@app.controller 'goalController', [ '$scope', 'goalModel', '$http', ($scope, goalModel, $http) ->

  getGoals = ->
    goalModel.index().then (response) ->
      $scope.goals = response.data

  $scope.addGoal = (goal) ->
    goalModel.postGoal(goal).then ->
      $scope.goals.push(goal)
      $scope.goal = ''

  $scope.updateGoal = (goal)->
    _goal = {'goal' : goal }
    $http(
      method: 'PUT'
      url: 'https://goalies-net.herokuapp.com/goals' + goal.id
      data: _goal
    )

  $scope.delete = (goal)->
    $http(
      method: 'DELETE'
      url: 'https://goalies-net.herokuapp.com/goals' + goal.id
    )
    goal.delete = true;

  getGoals()
]
