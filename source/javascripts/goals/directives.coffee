@app = angular.module 'goals'

@app.directive 'allGoals', ->
  template: "
    <h2>All my goals</h2>
    <div ng-repeat='goal in goals' class='goal-item' ng-hide='goal.delete'>
      <span class='name' editable-text='goal.name' ng-bind='goal.name' onaftersave='updateGoal(goal)'></span>
      <span>&nbsp;</span>
      <i class='circle' ng-bind='goal.circle'></i>
      <span class='controls'>
        <a ng-click='delete(goal)'>delete</a>
      </span>
    </div>
  "

@app.directive 'newGoalForm', ->
  template: "
    <form ng-submit='addGoal(goal)' name='goalform'>
      <input type='text' placeholder='enter goal' ng-model='goal.name'>
      <input type= 'radio'
             name='circle'
             ng-model='goal.circle'
             value='personal'>personal goal
      <input type= 'radio'
             name='circle'
             ng-model='goal.circle'
             value='relational'>relational goal
      <input type= 'radio'
             name='circle'
             ng-model='goal.circle'
             value='responsibility'>responsibility goal
      <br>
      <input type='submit' ng-model='goal' value='new goal'>
    </form>
  "
