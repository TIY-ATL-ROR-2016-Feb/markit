class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :title, :link_url
end
