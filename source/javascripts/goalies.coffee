@app = angular.module 'goalies', ['xeditable', 'angularMoment', 'goals', 'tasks', 'sidebar', 'ngRoute']

@app.constant 'myConfig', {
  # 'urlBase': 'http://localhost:3000/'
  'urlBase': 'https://goalies-net.herokuapp.com/'
}

@app.config [ '$routeProvider', ($routeProvider) ->

  $routeProvider.
    when( '/', {
    templateUrl: 'templates/index.html'
    }).
    when( '/tasks', {
    templateUrl: 'templates/tasks/index.html'
    controller: 'taskController'
    }).
    when( '/goals', {
    templateUrl: 'templates/goals/index.html'
    controller: 'goalController'
    }).
    otherwise( '/tasks')
]


