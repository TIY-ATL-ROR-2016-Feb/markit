class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: {
              scope: :post_id,
              message: "only get one vote per post."
            }
  validates_presence_of :user_id, :post_id, :score
end
