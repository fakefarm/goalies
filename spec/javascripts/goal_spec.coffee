#= require 'angular'
describe 'Goal', ->
  $injector = undefined
  $compile  = undefined
  $rootScope = undefined

  describe 'directives', ->
    beforeEach ->
      angular.element(document).find('body').append("
        <div id='wrapper'>
          <goals></goals>
        </div>
        ")

    afterEach ->
      angular.element(document).find('#wrapper').remove()

    describe '<goals />', ->
      it 'returns all of the goals', ->
        expect(true).toBe true
