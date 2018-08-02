class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :authentications

	has_many :friendships
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

	has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) }, foreign_key: "friend_id", class_name: "Friendship"
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user
	def self.all_except(user)
  where.not(id: user)
end
	def friends
	  active_friends | received_friends
	end
	def pending
		pending_friends | requested_friendships
	end

	def self.search(term)
	  if term
	    where('email LIKE ?', "%#{term}%").order('id DESC')
	  else
	    order('id DESC') 
	  end
	end
end