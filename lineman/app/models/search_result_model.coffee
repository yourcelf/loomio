angular.module('loomioApp').factory 'SearchResultModel', (BaseModel) ->
  class SearchResultModel extends BaseModel
    @singular: 'searchResult'
    @plural: 'searchResults'

    initialize: (data) ->
      @query = data.query
      @priority = data.priority
      @discussionId = data.discussion_id
      @proposalId = data.proposal_id

    discussion: ->
      @recordStore.discussions.find(@discussionId)

    proposal: ->
      @recordStore.proposals.find(@proposalId)
