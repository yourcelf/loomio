angular.module('loomioApp').controller 'DiscussionStartProposalController', ($scope, $translate, $modal, Records, UserAuthService) ->

  $scope.canStartProposals = ->
    !$scope.discussion.activeProposal() and UserAuthService.currentUser.canStartProposals($scope.discussion)

  $scope.openForm = ->
    modalInstance = $modal.open
      templateUrl: 'generated/templates/proposal_form.html'
      controller: 'ProposalFormController'
      resolve:
        proposal: ->
          Records.proposals.new(discussion_id: $scope.discussion.id)
