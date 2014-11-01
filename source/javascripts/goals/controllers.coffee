@app = angular.module 'goals'

@app.controller 'goalController', [ '$scope', 'goalModel', ($scope, goalModel) ->

  getGoals = ->
    goalModel.getGoals().then (response) ->
      $scope.goals = response.data

  $scope.addGoal = (goal) ->
    goalModel.postGoal(goal).then ->
      $scope.goals.push(goal)
      $scope.goal = ''

  getGoals()
]
