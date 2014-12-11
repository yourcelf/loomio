class SearchResultSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :priority, :query

  has_one :discussion, serializer: DiscussionSerializer, root: 'discussions'
  has_one :motion, serializer: MotionSerializer, root: 'proposals'

  def include_discussion?
    object.discussion.present?
  end

  def include_motion?
    object.motion.present?
  end
end
