@app = angular.module 'goals'

@app.factory 'goalModel', [ '$http', 'myConfig', ($http, myConfig) ->

  urlBase = myConfig.urlBase + 'goals/'

  goals = {}
  goals.index = ->
    $http({
        method: 'GET'
        url: urlBase
      }).success (response)->
        response

  goals.postGoal = (goal) ->
    _goal = {'goal' : goal }
    $http({
      method: 'POST'
      url: urlBase
      data: goal
      }).success (data) ->
        return data

  goals.update = (goal)->
    _goal = {'goal' : goal }
    $http(
      method: 'PUT'
      url: urlBase + goal.id
      data: _goal
    )

  goals.destroy = (goal)->
    $http(
      method: 'DELETE'
      url: urlBase + goal.id
    )

  return goals
]

@app.factory 'taskModel', [ '$http', 'myConfig', ($http, myConfig) ->

  urlBase = myConfig.urlBase + 'tasks/'

  tasks = {}
  tasks.index = ->
    $http({
        method: 'GET'
        url: urlBase
      }).success (response)->
        response

  tasks.postTask = (task) ->
    _task = { 'task' : task }
    $http({
      method: 'POST'
      url: urlBase
      data: task
      }).success (data) ->
        return data

  tasks.update = (task)->
    _task = {'task' : task }
    $http(
      method: 'PUT'
      url: urlBase + task.id
      data: _task
    )

  tasks.destroy = (task)->
    $http(
      method: 'DELETE'
      url: urlBase + task.id
    )

  return tasks
]




