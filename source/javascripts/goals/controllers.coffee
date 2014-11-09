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

@app.controller 'taskController', [ '$scope', 'taskModel', 'goalModel', ($scope, taskModel, goalModel) ->

  goalModel.index().then (response) ->
    $scope.goals = response.data

    goalNames = {}
    _.each $scope.goals, (gg) ->
      goalNames[gg.id] = gg.name

    $scope.align = (task) ->
      if task.goal_id
        goalNames[task.goal_id]
      else
        'what goal?'


  getTasks = ->
    taskModel.index().then (response) ->
      tasks = response.data
      $scope.tasks = _.filter tasks, (task) ->
        if task.completed == false && (moment(task.snooze) < moment())
          task

  completedTasks = ->
    taskModel.index().then (response) ->
      tasks = response.data
      $scope.completedTasks = _.filter tasks, (task) ->
        if task.completed == true
          task

  snoozedTasks = ->
    taskModel.index().then (response) ->
      tasks = response.data
      $scope.snoozedTasks = _.filter tasks, (task) ->
        if task.completed == false && (moment(task.snooze) > moment())
          task

  $scope.new = (task) ->
    task.snooze = moment()
    $scope.tasks.push(task)
    $scope.task = ''
    taskModel.postTask(task)

  $scope.update = (task)->
    taskModel.update(task)

  $scope.snooze = (task)->
    task.snooze = moment(task.snooze).add(3, 'days')
    taskModel.update(task)

  $scope.return = (task)->
    task.snooze = moment()
    taskModel.update(task)

  $scope.complete = (task)->
    task.completed = true
    taskModel.update(task)

  $scope.destroy = (task)->
    taskModel.destroy(task).then ->
      task.delete = true;

  getTasks()
  completedTasks()
  snoozedTasks()
]
