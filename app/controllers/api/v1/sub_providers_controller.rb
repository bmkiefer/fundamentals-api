class Api::V1::SubProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
        subscriptions = Subscription.where(:provider_id => params[:id])

	render :status => 200,
           :json => { :success => true,
                      :info => "List of Subscriptions",
                      :data => {

                                   "subscriptions" => subscriptions
                                   
                               }
                    }
  end

end
