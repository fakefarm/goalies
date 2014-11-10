@app = angular.module 'goals'

@app.controller 'goalController', [ '$scope', 'goalModel', ($scope, goalModel) ->

  getGoals = ->
    goalModel.index().then (response) ->
      $scope.goals = response.data

  $scope.new = (goal) ->
    goalModel.postGoal(goal).then ->
      $scope.goals.push(goal)
      $scope.goal = ''

  $scope.update = (goal)->
    goalModel.update(goal)

  $scope.destroy = (goal)->
    goalModel.destroy(goal).then ->
      goal.delete = true;

  getGoals()
]
