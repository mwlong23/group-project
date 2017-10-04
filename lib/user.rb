class User < ActiveRecord::Base
  validates :first_name, length: { minimum: 2, maximum: 15}
  validates :last_name, length: { minimum: 2, maximum: 15}
  validates :password, length: { minimum: 2, maximum: 25}
  has_one(:profile)
  has_and_belongs_to_many(:meetups)
end
