#= require 'angular'
#= require 'angular-mocks'
#= require 'jquery'
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
    beforeEach ->
      $('body').append("
        <div id='wrapper'>
        </div>
        ")

    afterEach ->
      $('#wrapper').remove()

    describe '<goals>', ->
      it 'contains the goal title', ->
        element = $('#wrapper').html('<goals></goals>')
        $compile(element)($scope)
        expect(element.html()).toContain 'All my goals'

      it 'lists out all the goals'

  describe 'services', ->
    describe 'models', ->
      describe 'goalModel', ->
        describe '#getGoals', ->
          it 'returns all the goals', ->
