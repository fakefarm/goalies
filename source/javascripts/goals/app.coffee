'use strict'

@app = angular.module 'goals', ['goalies']

@app.constant 'myConfig', {
  # 'urlBase': 'http://localhost:3000/'
  'urlBase': 'https://goalies-net.herokuapp.com/'
}

# looks like a handy post when ready to talk auth
# http://ionicframework.com/blog/angularjs-authentication/
# $httpProvider.defaults.withCredentials = true;

