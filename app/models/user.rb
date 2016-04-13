class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  ## example: @user.posts runs Post.where(user_id: @user.id)
  ## can also do @user.posts.create(post parameters go here)

  has_many :votes
  ## example: @user.votes runs Vote.where(user_id: @user.id)

  has_many :voted_posts, through: :votes

  validates :email, format: {
              with: /\A.+@.+\..+\Z/,
              message: "must have an @ symbol and period"
            }
end
