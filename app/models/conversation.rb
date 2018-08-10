class Conversation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :friend, class_name: 'User'

  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  validates :user, uniqueness: {scope: :friend}

  scope :participating, -> (user) do
    where("(conversations.user_id = ? OR conversations.friend_id = ?)", user.id, user.id)
  end

  scope :between, -> (sender_id, reciever_id) do
    where(user_id: sender_id, friend_id: reciever_id).or(where(user_id: reciever_id, friend_id: sender_id))
  end

  def with(current_user)
    user == current_user ? friend : user
  end

  def participates?(user)
    user == user || friend == user
  end
end