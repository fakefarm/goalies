@app = angular.module 'goals'

@app.directive 'allGoals', ->
  template: "
    <h2>All my goals</h2>
    <div ng-repeat='goal in goals' class='goal-item' ng-hide='goal.delete'>
      <span class='name' editable-text='goal.name' ng-bind='goal.name' onaftersave='update(goal)'></span>
      <span>&nbsp;</span>
      <i class='circle' ng-bind='goal.circle'></i>
      <span class='controls'>
        <a ng-click='destroy(goal)'>delete</a>
      </span>
    </div>
  "

@app.directive 'allTasks', ->
  template: "
    <h2>To Do</h2>
    <div ng-repeat='task in tasks' class='task-item' ng-hide='task.completed'>
      <span class='task-alignment'>o</span>
      <span class='name' editable-text='task.name' ng-bind='task.name' onaftersave='update(task)'></span>
      <span class='controls'>
        <a ng-click='snooze(task)'>snooze</a>
        <a ng-click='complete(task)'>complete</a>
      </span>
    </div>
  "

@app.directive 'snoozedTasks', ->
  template: "
    <h2>Snoozed</h2>
    <div ng-repeat='task in snoozedTasks' class='task-item' ng-hide='task.completed'>
      <span class='task-alignment'>o</span>
      <span class='name' editable-text='task.name' ng-bind='task.name' onaftersave='update(task)'></span>
      <span class='controls'>
        <a ng-click='return(task)'>return</a>
        <a ng-click='complete(task)'>complete</a>
      </span>
    </div>
  "


@app.directive 'completedTasks', ->
  template: "
    <h2>Completed</h2>
    <div ng-repeat='task in completedTasks' class='task-item' ng-show='task.completed'>
      <span class='name' editable-text='task.name' ng-bind='task.name' onaftersave='update(task)'></span>
      <span class='controls'>
        <a href=''
           onaftersave='update(task)'
           buttons='no'
           editable-select='task.goal_id'
           e-ng-options='goal.id as goal.name for goal in goals'
           ng-bind='align(task)'>
        </a>
      </span>
    </div>
  "


@app.directive 'newGoalForm', ->
  template: "
    <form novalidate ng-submit='new(goal)' name='goalform'>
      <input type='text' placeholder='enter goal' ng-model='goal.name'>
      <input type= 'radio'
             required='goalform.circle'
             name='circle'
             ng-model='goal.circle'
             value='personal'>personal
      <input type= 'radio'
             required='goalform.circle'
             name='circle'
             ng-model='goal.circle'
             value='relational'>relational
      <input type= 'radio'
             required='goalform.circle'
             name='circle'
             ng-model='goal.circle'
             value='responsibility'>responsibility
      <br>
      <input type= 'radio'
             required='goalform.quarter'
             name='quarter'
             ng-model='goal.quarter'
             value='now'>Now
      <input type= 'radio'
             required='goalform.quarter'
             name='quarter'
             ng-model='goal.quarter'
             value='later'>Later
      <br>
      <input type='submit' ng-model='goal' value='new goal'>
    </form>
  "


@app.directive 'newTaskForm', ->
  template: "
    <form novalidate ng-submit='new(task)' name='taskform'>
      <input type='text' placeholder='enter task' ng-model='task.name'>
      <br>
      <input type='submit' ng-model='task' value='new task'>
    </form>
  "
