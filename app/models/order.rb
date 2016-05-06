class Order < ActiveRecord::Base
  belongs_to :account
  belongs_to :food

  scope :ordered, -> { includes(:account).order('accounts.location DESC') }
  scope :priced, -> { includes(:food) }
end
