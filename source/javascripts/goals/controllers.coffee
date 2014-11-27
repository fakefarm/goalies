@app = angular.module 'goals'

@app.controller 'goalController', [ '$scope', 'goalModel', '$routeParams', ($scope, goalModel, $routeParams) ->

  getGoals = ->
    goalModel.index().then (response) ->
      $scope.goals = response.data
      goalShow() # how do I fix this?

  goalShow = ->
    # what's the right way to show goals on a page?
    $scope.goal = _.find $scope.goals, (goal) ->
      goal.id == parseInt( $routeParams.id, 10 )

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
  return
]


