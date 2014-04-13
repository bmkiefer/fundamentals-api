class Api::V1::UserContentElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
        my_providers = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        my_content_elements = ContentElements.where(:provider_id => my_providers).order("released_date asc")

	render :status => 200,
           :json => { :success => true,
                      :info => "My Subscriptions",
                      :data => {

                                   "content_elements" => my_content_elements
                                   
                               }
                    }
  end

end