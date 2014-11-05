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
      url: 'http://localhost:3000/goals/' + goal.id
      data: _goal
    )

  $scope.delete = (goal)->
    # debugger
    $http(
      method: 'DELETE'
      url: 'http://localhost:3000/goals/' + goal.id
    )
    goal.delete = true;

  getGoals()
]
