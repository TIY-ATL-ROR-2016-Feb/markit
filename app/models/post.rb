class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :voters, through: :votes

  validates_presence_of :user_id, :title, :link_url
end
