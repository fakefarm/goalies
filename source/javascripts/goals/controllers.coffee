@app = angular.module 'goals'

@app.controller 'goalController', [ '$scope', 'goalModel', '$routeParams', ($scope, goalModel, $routeParams) ->

  getGoals = ->
    goalModel.index().then (response) ->
      $scope.goals = response.data



  $scope.new = (goal) ->
    goal.id = goal.id
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
