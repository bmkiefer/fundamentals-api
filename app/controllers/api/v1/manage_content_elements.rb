class Api::V1::ManageContentElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
	my_content = ContentElement.find(params[:id])

	my_content.update_column(:name, params[:name])
	my_content.update_column(:url, params[:link])
	
	if params[:hidden_flag] == true
	  my_content.update_column(:hidden_flag, true)
	else
          my_content.update_column(:hidden_flag, nil)
	end

	  render :status => 200,
           :json => { :success => true,
                      :info => "Content Elements Details Changed",
                      :data => { }
                    }
  end

end
