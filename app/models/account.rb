class Account < ActiveRecord::Base
  has_many :orders

end
