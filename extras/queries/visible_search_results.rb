class Queries::VisibleSearchResults < Delegator
  def initialize(user: nil, query: '')
    @user, @query, @results = user, query, []
    @results = sorted_results.each_with_index.map { |result, index| SearchResult.new(result, query, index) }
    super @results
  end

  def __getobj__
    @relation
  end

  def __setobj__(obj)
    @relation = obj
  end

  private

  def sorted_results # these aren't actually sorted yet
    @user.discussions.search(@query) + @user.motions.search(@query)
  end

end
