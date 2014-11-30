angular.module('loomioApp').directive 'discussionStartProposal', ->
  scope: {discussion: '='}
  restrict: 'E'
  templateUrl: 'generated/templates/discussion_start_proposal.html'
  replace: true
  controller: 'DiscussionStartProposalController'
