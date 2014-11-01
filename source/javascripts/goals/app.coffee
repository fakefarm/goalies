'use strict'

@app = angular.module 'goals', []

@app.factory 'goalModel', [ '$http', ($http) ->

  urlBase = 'https://goalies-net.herokuapp.com/goals'

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
      method: 'POST'
      url: urlBase
      data: goal
      }).success (data) ->
        return data

  return goals
]

@app.controller 'goalController', [ '$scope', 'goalModel', ($scope, goalModel) ->

  getGoals = ->
    goalModel.getGoals().then (response) ->
      $scope.goals = response.data

  $scope.addGoal = (goal) ->
    goalModel.postGoal(goal).then ->
      $scope.goals.push(goal)
      $scope.goal = ''

  getGoals()
]
