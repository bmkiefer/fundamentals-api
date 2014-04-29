class Api::V1::SubscriptionsController < ApplicationController
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

  def create
	Subscription.create(:name => params[:name], :provider_id => params[:provider_id], :days => params[:days], :months => params[:memory], :years => params[:years])
        render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Type Added",
                      :data => { }
                    }
  end

  def delete

	Subscription.find(params[:sub_id]).delete

        render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Type Removed",
                      :data => { }
                    }
  end

end
