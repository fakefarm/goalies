'use strict'

@app = angular.module 'goals', ['goalies']

@app.constant 'myConfig', {
  # 'backend': 'http://localhost:3000/goals/'
  'backend': 'https://goalies-net.herokuapp.com/goals/'
}

# @app.constant 'dev', { backend: "http://localhost:3000/goals" }
# @app.constant 'prod', { backend: "https://goalies-net.herokuapp.com/goals" }

# @app.config [ 'dev', (dev)->
#   @server = arguments[0].backend
# ]

  # looks like a handy post when ready to talk auth
  # http://ionicframework.com/blog/angularjs-authentication/
  # $httpProvider.defaults.withCredentials = true;

