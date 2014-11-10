@app = angular.module 'tasks'

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

  _removeTaskFromAllTasks = (task) ->
    index = ''
    _.each $scope.tasks, (t) ->
      if t.id == task.id
        index = $scope.tasks.indexOf(task)
    $scope.tasks.splice(index, 1)

  _removeTaskFromSnoozedTasks = (task) ->
    index = ''
    _.each $scope.snoozedTasks, (t) ->
      if t.id == task.id
        index = $scope.snoozedTasks.indexOf(task)
    $scope.snoozedTasks.splice(index, 1)

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
    $scope.snoozedTasks.push(task)
    _removeTaskFromAllTasks(task)

  $scope.return = (task)->
    task.snooze = moment()
    taskModel.update(task)
    $scope.tasks.push(task)
    _removeTaskFromSnoozedTasks(task)

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
