angular.module('loomioApp').factory 'SearchResultRecordsInterface', (BaseRecordsInterface, SearchResultModel) ->
  class SearchResultRecordsInterface extends BaseRecordsInterface
    model: SearchResultModel

    fetchByFragment: (fragment) ->
      @restfulClient.resourcePlural = 'search_results'
      @restfulClient.getCollection(q: fragment)

    findByFragment: (fragment) ->
      @collection.find(query: fragment)