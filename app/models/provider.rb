class Provider < ActiveRecord::Base
  has_many :subscribed_tos
  has_many :subscriptions
  belongs_to :content_area
  belongs_to :delivery 
end
