class Api::V1::UserContentElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
        my_providers = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
      #  my_content_elements = ContentElement.where(:provider_id => my_providers).order("released_date asc").
        my_content_elements = ContentElement.where(:provider_id => my_providers)

	render :status => 200,
           :json => { :success => true,
                      :info => "My Subscriptions",
                      :data => {

                                   "content_elements" => my_content_elements
                                   
                               }
                    }
  end

  def show
        my_content_element = ContentElement.find(params[:id])
	provider = Provider.find(my_content_element.provider_id)

        render :status => 200,
           :json => { :success => true,
                      :info => "My Subscriptions",
                      :data => {

                                   "content_elements" => {

					"name" => my_content_element.name,
					"url" => my_content_element.url,
					"provider_name" => provider.name
				   }
                               }
                    }
  end

end
