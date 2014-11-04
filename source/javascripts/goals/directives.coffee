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

@app.directive 'newGoalForm', ->
  template: "
    <form ng-submit='addGoal(goal)' name='goalform'>
      <input type='text' placeholder='enter goal' ng-model='goal.name'>
      <input type= 'radio'
             name='circle'
             ng-model='goal.circle'
             value='myself'>myself
      <input type= 'radio'
             name='circle'
             ng-model='goal.circle'
             value='others'>others
      <input type= 'radio'
             name='circle'
             ng-model='goal.circle'
             value='work'>work
      <br>
      <input type='submit' ng-model='goal' value='new goal'>
    </form>
  "
