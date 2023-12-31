class ConversationSerializer < ActiveModel::Serializer
  attributes :id,:last_message,:user_1, :user_2
  # has_many :messages
  belongs_to :user_1, serializer: ReviewUserSerializer
  belongs_to :user_2, serializer: ReviewUserSerializer

  def last_message
    object.messages.order(:created_at).last
  end
end
