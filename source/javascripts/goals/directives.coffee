@app = angular.module 'goals'

@app.directive 'allGoals', ->
  template: "
    <h2>All my goals</h2>
    <div ng-repeat='goal in goals'>
      <span class='name' ng-bind='goal.name'></span>
      <span>&nbsp;</span>
      <i class='circle' ng-bind='goal.circle'></i>
    </div>
    "
