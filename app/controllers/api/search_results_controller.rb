class API::SearchResultsController < API::RestfulController
  def index
    @search_results = Queries::VisibleSearchResults.new(user: current_user, query: params[:q])
    respond_with_collection
  end

  def serializer_root
    :discussions
  end

end
