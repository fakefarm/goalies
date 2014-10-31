'use strict'

@app = angular.module 'goalies', []

@app.factory 'goalModel', [ '$http', ($http) ->
  urlBase = 'https://goalies-net.herokuapp.com/goals'
  goals = {}
  goals.getGoals = (goals)->
    $http({
        method: 'GET',
        url: urlBase
      }).success (data)->
        goals = data
  return goals
]

@app.controller 'goalController', [ '$scope', 'goalModel', ($scope, goalModel) ->

  getGoals = ->
    goalModel.getGoals().then (response) ->
      $scope.goals = response.data

  $scope.addGoal = (goal) ->
    $scope.goals.push(goal)
    $scope.goal = {}

  getGoals()
]

