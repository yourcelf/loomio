class Queries::VisibleSearchResults < Delegator
  def initialize(user: nil, query: '')
    @user, @query, @results = user, query, []
    @results = all_results.each_with_index.map { |result, index| SearchResult.new(result, index) }
    super @results
  end

  def __getobj__
    @relation
  end

  def __setobj__(obj)
    @relation = obj
  end

  private

  def all_results
    @user.discussions.search(@query) + @user.motions.search(@query)
  end

end
