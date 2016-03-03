class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: { minimum: 2 }

  has_many :articles
end
