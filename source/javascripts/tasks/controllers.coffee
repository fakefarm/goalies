@app = angular.module 'tasks'

@app.controller 'taskController', [ '$scope', 'taskModel', 'goalModel', ($scope, taskModel, goalModel) ->

  $scope.openSidebar = true

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

  toggleSideBar = ->
    console.log 'you clicked'
    # $scope.openSidebar != $scope.openSidebar

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

  moveFrom = (list, item) ->
    index = ''
    _.each list, (t) ->
      if t.id == item.id
        index = list.indexOf(item)
    list.splice(index, 1)

  moveTo = (list, item) ->
    list.push(item)

  $scope.snooze = (task)->
    task.snooze = moment(task.snooze).add(3, 'days')
    taskModel.update(task)
    moveFrom($scope.tasks, task)
    moveTo($scope.snoozedTasks, task)

  $scope.return = (task)->
    task.snooze = moment()
    taskModel.update(task)
    moveFrom($scope.snoozedTasks, task)
    moveTo($scope.tasks, task)

  $scope.undo = (task)->
    task.completed = false
    taskModel.update(task)
    moveFrom($scope.completedTasks, task)
    moveTo($scope.tasks, task)

  $scope.complete = (task)->
    task.completed = true
    taskModel.update(task)
    moveFrom($scope.tasks, task)
    moveTo($scope.completedTasks, task)

  $scope.destroy = (task)->
    taskModel.destroy(task).then ->
      task.delete = true;

  getTasks()
  completedTasks()
  snoozedTasks()
]
