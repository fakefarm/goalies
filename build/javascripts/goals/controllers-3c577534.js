(function(){this.app=angular.module("goals"),this.app.controller("goalController",["$scope","goalModel",function(o,n){var t;return t=function(){return n.getGoals().then(function(n){return o.goals=n.data})},o.addGoal=function(t){return n.postGoal(t).then(function(){return o.goals.push(t),o.goal=""})},t()}])}).call(this);