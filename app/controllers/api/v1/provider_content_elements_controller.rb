class Api::V1::ProviderContentElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
        content_elements = ContentElement.where(:provider_id => params[:id])

        render :status => 200,
           :json => { :success => true,
                      :info => "Content Elements for Provider",
                      :data => {

                                   "content_elements" => content_elements

                               }
                    }
  end

  def show
        content_element = ContentElement.find(params[:id])
	format = Format.find(content_element.format_id)

        render :status => 200,
           :json => { :success => true,
                      :info => "My Subscriptions",
                      :data => {

                                   "content_element" => {
					"format_name" => format.name,
                                        "name" => content_element.name,
                                        "url" => content_element.url,
                                        "hidden_flag" => content_element.hidden_flag
                                   }

                               }
                    }
  end
end
