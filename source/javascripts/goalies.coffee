@app = angular.module 'goalies', ['xeditable', 'angularMoment', 'goals', 'tasks']

@app.constant 'myConfig', {
  # 'urlBase': 'http://localhost:3000/'
  'urlBase': 'https://goalies-net.herokuapp.com/'
}
