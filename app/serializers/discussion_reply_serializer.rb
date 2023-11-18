class DiscussionReplySerializer < ActiveModel::Serializer
  # attributes :id,:content,:upvotes, :user_id, :created_at
  attributes :id,:content, :user_id, :created_at
  belongs_to :user
end
