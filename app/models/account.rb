class Account < ActiveRecord::Base
  has_many :orders
  has_many :foods, through: :orders

end
