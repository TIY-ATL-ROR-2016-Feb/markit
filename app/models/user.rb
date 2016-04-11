class User < ActiveRecord::Base
  has_secure_password

  validates :email, format: {
              with: /\A.+@.+\..+\Z/,
              message: "must have an @ symbol and period"
            }
end
