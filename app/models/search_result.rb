class SearchResult
  include ActiveModel::Serialization

  attr_accessor :discussion, :motion
  def initialize(obj, priority)
    set_result_for(obj)
    @priority = priority
  end

  def read_attribute_for_serialization(field)
    attributes[field]
  end

  def attributes
    {
      discussion: @discussion,
      motion: @motion,
      priority: @priority
    }
  end

  def set_result_for(obj)
    case obj
    when Discussion then
      @discussion = obj
    when Motion     then
      @discussion = obj.discussion
      @motion = obj
    end
  end

end