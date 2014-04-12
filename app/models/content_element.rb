class ContentElement < ActiveRecord::Base
  belongs_to :format
  belongs_to :provider
end
