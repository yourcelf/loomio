angular.module('loomioApp').factory 'SearchResultRecordsInterface', (BaseRecordsInterface, SearchResultModel) ->
  class SearchResultRecordsInterface extends BaseRecordsInterface
    model: SearchResultModel

    initialize: (data) ->
      existingRecord = @find(query: data.query, priority: data.priority)

      if existingRecord.length > 0
        existingRecord[0]
      else
        record = new @model(@, data)
        @collection.insert(record)
        record

    fetchByFragment: (fragment) ->
      @restfulClient.getCollection(q: fragment)

    findByFragment: (fragment) ->
      @collection.find(query: fragment)