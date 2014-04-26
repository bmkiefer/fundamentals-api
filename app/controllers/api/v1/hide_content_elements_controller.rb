class Api::V1::HideContentElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def create
	change = ContentElement.find(params[:id])

	if change.hidden_flag == true
	  change.update_column(:hidden_flag, nil)
	else
	  change.update_column(:hidden_flag, true)
	end
	
	render :status => 200,
           :json => { :success => true,
                      :info => "Toggled Content Element Status",
                      :data => { }
                    }
  end

end
