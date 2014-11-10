@app = angular.module 'tasks'

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




