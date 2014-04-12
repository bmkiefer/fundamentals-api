class SubscribedTo < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider
  belongs_to :subscription
end
