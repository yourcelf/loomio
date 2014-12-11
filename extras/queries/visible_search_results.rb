class Queries::VisibleSearchResults < Delegator
  def initialize(user: nil, query: '')
    @results = user.discussions.search(query) + user.motions.search(query).map(&:discussion)

    super @results
  end

  def __getobj__
    @relation
  end

  def __setobj__(obj)
    @relation = obj
  end

end
