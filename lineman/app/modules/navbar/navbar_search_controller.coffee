angular.module('loomioApp').controller 'NavbarSearchController', ($scope, UserAuthService, Records) ->

  $scope.availableGroups = ->
    UserAuthService.currentUser.groups() if UserAuthService.currentUser?

  $scope.getSearchResults = ->
    if $scope.query?
      Records.searchResults.fetchByFragment $scope.query

  $scope.searchResults = ->
    Records.searchResults.findByFragment $scope.query
