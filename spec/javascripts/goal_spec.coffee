#= require 'angular'
#= require 'angular-mocks'
#= require 'goals/app'
#= require 'goals/directives'
#= require 'goalies'

describe 'Goal', ->
  $injector  = undefined
  $compile   = undefined
  $rootScope = undefined
  $scope     = undefined

  beforeEach module('goals')

  beforeEach inject (_$injector_)->
    $injector = _$injector_
    $compile = $injector.get('$compile')
    $rootScope = $injector.get('$rootScope')
    $scope = $rootScope.$new()


  describe 'directives', ->
    goals = undefined
    beforeEach ->
      goals = angular.element(document).find('body').append("
        <div id='wrapper'>
        <goals></goals>
        </div>
        ")

    afterEach ->
      angular.element(document).find('#wrapper').remove()

    describe '<goals />', ->
      it 'returns all of the goals', ->
        element = $compile(goals)($scope)

        expect(element.html()).toContain 'All my goals'
