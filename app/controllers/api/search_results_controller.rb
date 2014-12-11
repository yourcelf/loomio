class API::SearchResultsController < API::BaseController
  def index
    @search_results = Queries::VisibleSearchResults.new(user: current_user, query: params[:q])
    render json: ActiveModel::ArraySerializer.new(@search_results, each_serializer: SearchResultSerializer, root: :search_results)
  end
end
