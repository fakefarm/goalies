@app = angular.module 'goals'

@app.factory 'goalModel', [ '$http', ($http) ->

  urlBase = 'https://goalies-net.herokuapp.com/goals'

  goals = {}
  goals.getGoals = ->
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

  return goals
]
