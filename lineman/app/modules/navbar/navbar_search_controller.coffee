angular.module('loomioApp').controller 'NavbarSearchController', ($scope, UserAuthService, Records) ->

  $scope.availableGroups = ->
    UserAuthService.currentUser.groups() if UserAuthService.currentUser?

  $scope.getSearchResults = ->
    if $scope.query?
      Records.search_results.fetchByFragment $scope.query

  $scope.searchResults = ->
    Records.search_results.findByFragment $scope.query
