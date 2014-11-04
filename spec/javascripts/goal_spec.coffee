# TODO - figure out how to manage these through jasmine.yml
# TODO - move files into own spec

#= require 'angular'
#= require 'angular-mocks'
#= require 'jquery'
#= require 'goals/app'
#= require 'goals/directives'
#= require 'goals/models'
#= require 'goalies'

describe 'Goal', ->
  $injector  = undefined
  $compile   = undefined
  $rootScope = undefined
  $scope     = undefined

  beforeEach module('goals')

  beforeEach inject (_$injector_)->
    $injector     = _$injector_
    $compile      = $injector.get('$compile')
    $rootScope    = $injector.get('$rootScope')
    $scope        = $rootScope.$new()

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
    $httpBackend = undefined
    urlBase = 'https://goalies-net.herokuapp.com/goals'

    beforeEach ->
      $httpBackend  = $injector.get('$httpBackend')

    describe 'models', ->
      describe 'goalModel', ->
        goalModel    = undefined
        beforeEach ->
          goalModel     = $injector.get('goalModel')
          # TODO - how can I use mocks instead?
          $httpBackend.whenGET(urlBase).respond([
            {
              "id": 1,
              "name": "learn to program",
              "category": null,
              "circle": "responsibility",
              "created_at": "2014-10-30T20:22:31.827Z",
              "updated_at": "2014-10-30T20:22:31.827Z"
            },
            {
              "id": 2,
              "name": "swim 500 laps",
              "category": null,
              "circle": "personal",
              "created_at": "2014-10-30T20:23:10.057Z",
              "updated_at": "2014-10-30T20:23:10.057Z"
            }
          ])

        afterEach ->
          $httpBackend.verifyNoOutstandingExpectation()
          $httpBackend.verifyNoOutstandingRequest()

        describe '#index', ->
          it 'returns all the goals', ->
            goalModel.index().then (response)->
              expect(response.data[0].name).toBe 'learn to program'
            $httpBackend.flush()

        describe '#create', ->
          it 'creates a new goal', ->
            goal =
                "name": "Learn how to TDD",
                "circle": "responsibility",
            $httpBackend.expectPOST(urlBase, goal).respond(201, goal);
            goalModel.postGoal(goal)
            $httpBackend.flush()
            # TODO HOW DO I TEST THIS?
            expect(goalModel.length).toBe 3

        describe '#edit', ->
          it 'edits existing goal', ->
        describe '#delete', ->
          it 'deletes a goal', ->
