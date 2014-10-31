'use strict'

@app = angular.module 'goals', []

@app.factory 'goalModel', [ '$http', ($http) ->

  urlBase = 'https://goalies-net.herokuapp.com/goals'
  # urlBase = 'http://localhost:3000/goals'

  goals = {}
  goals.getGoals = (goals)->
    $http({
        method: 'GET'
        url: urlBase
      }).success (response)->
        response

  goals.postGoal = (goal) ->
    _goal = {'goal' : goal }
    $http({
      headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8; application/json' }
      method: 'POST'
      url: urlBase
      data: goal
      }).success (data) ->
        return data
  return goals
]

@app.controller 'goalController', [ '$scope', 'goalModel', '$http', ($scope, goalModel, $http) ->

  getGoals = ->
    goalModel.getGoals().then (response) ->
      $scope.goals = response.data

  # $scope.addGoal = (goal) ->
  #   goalModel.postGoal(goal).then ->
  #     debugger
  #     $scope.goals.push(goal)
  #   return

  # $scope.addGoal = (goal) ->
  #   $http
  #     url: 'http://localhost:3000/goals'
  #     method: 'POST'
  #     data: { goal: goal }

  getGoals()
]

