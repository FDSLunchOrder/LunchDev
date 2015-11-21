class Order < ActiveRecord::Base
  belongs_to :account
  belongs_to :food
end
