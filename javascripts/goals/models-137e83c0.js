(function(){this.app=angular.module("goals"),this.app.factory("goalModel",["$http",function(t){var o,n;return n="https://goalies-net.herokuapp.com/goals",o={},o.getGoals=function(){return t({method:"GET",url:n}).success(function(t){return t})},o.postGoal=function(o){var a;return a={goal:o},t({method:"POST",url:n,data:o}).success(function(t){return t})},o}])}).call(this);