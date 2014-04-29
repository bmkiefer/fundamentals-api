class Api::V1::UpdateAccountController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def create
	user = User.find(current_user.id)

	user.email = params[:email]
	user.credit_card_number = params[:credit_card_number]
	user.expiraton_date = params[:expiration_date]
	user.name = params[:name]
	user.csc = params[:csc]

	user.save	

	render :status => 200,
           :json => { :success => true,
                      :info => "Account Information Updated",
                      :data => { }
                    }
  end

end
