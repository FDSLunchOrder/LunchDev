class Food < ActiveRecord::Base
  belongs_to :restaurant
  has_many :accounts, through: :orders
end
