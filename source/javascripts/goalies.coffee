@app = angular.module 'goalies', ['xeditable', 'angularMoment', 'goals', 'tasks', 'ngRoute']

@app.constant 'myConfig', {
  'urlBase': 'http://localhost:3000/'
  # 'urlBase': 'https://goalies-net.herokuapp.com/'
}

@app.config [ '$routeProvider', '$locationProvider', ($routeProvider) ->
  $routeProvider.
    when( '/', {
    templateUrl: 'templates/index.html'
    }).
    when( '/tasks', {
    templateUrl: 'templates/tasks/index.html'
    controller: 'taskController'
    }).
    when( '/goals', {
    templateUrl: 'templates/goals/all_goals.html'
    controller: 'goalController'
    }).
    otherwise( '/')
]


