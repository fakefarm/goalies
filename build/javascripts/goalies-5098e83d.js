(function(){this.app=angular.module("goalies",["xeditable","angularMoment","goals","tasks","ngRoute"]),this.app.constant("myConfig",{urlBase:"https://goalies-net.herokuapp.com/"}),this.app.config(["$routeProvider",function(t){return t.when("/",{templateUrl:"templates/index.html"}).when("/tasks",{templateUrl:"templates/tasks/index.html",controller:"taskController"}).otherwise("/tasks")}])}).call(this);