@app = angular.module 'tasks'

@app.directive 'newTaskForm', ->
  template: "
    <form novalidate ng-submit='new(task)' name='taskform'>
      <input type='text' placeholder='enter task' ng-model='task.name'>
      <br>
      <input type='submit' ng-model='task' value='new task'>
    </form>
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
