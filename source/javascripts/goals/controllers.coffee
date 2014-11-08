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

@app.controller 'taskController', [ '$scope', 'taskModel', ($scope, taskModel) ->

  getTasks = ->
    taskModel.index().then (response) ->
      $scope.tasks = response.data

  $scope.new = (task) ->
    taskModel.postTask(task).then ->
      $scope.tasks.push(task)
      $scope.task = ''

  $scope.update = (task)->
    taskModel.update(task)

  $scope.destroy = (task)->
    taskModel.destroy(task).then ->
      task.delete = true;

  getTasks()
]
