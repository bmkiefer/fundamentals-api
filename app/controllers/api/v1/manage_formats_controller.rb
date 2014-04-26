class Api::V1::ManageFormatsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def create

    	 my_format = Format.find(params[:id])


 	 if my_format.hidden_flag == nil
		my_format.update_column(:hidden_flag, true)
 	 else	
		my_format.update_column(:hidden_flag, nil)
 	 end

 	 render :status => 200,
           :json => { :success => true,
                      :info => "Format Visibility Toggled",
                      :data => { }
                    } 

  end

end
