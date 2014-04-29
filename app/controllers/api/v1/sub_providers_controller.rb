class Api::V1::SubProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
        subscriptions = Subscription.where(:provider_id => params[:id])
	
	provider = Provider.find(params[:id])

	content_area = ContentArea.find(provider.content_area_id)

	delivery_mode = DeliveryMode.find(provider.delivery_mode_id)

        subscription = SubscribedTo.where(:user_id => current_user.id ,:provider_id => params[:id]).pluck(:subscription_id).first

	render :status => 200,
           :json => { :success => true,
                      :info => "List of Subscriptions",
                      :data => {

                                   "subscriptions" => subscriptions ,
                                   "content_area" => content_area.name,
			           "delivery_mode" => delivery_mode.name,
				   "sub_id" => subscription
                               }
                    }
  end

  def create
	sub = Subscription.find(params[:sub_id])

	date = Date.today
        date.to_time.advance(:days => sub.days).to_date
	date.to_time.advance(:months => sub.months).to_date
	date.to_time.advance(:years => sub.years).to_date
	
        SubscribedTo.create!(:user_id => current_user.id, :provider_id => params[:provider_id], :subscription_id => params[:sub_id], :expiration_date => date)
        render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Added",
                      :data => { }
                    }
  end

  def destroy
        subscription = SubscribedTo.where(:user_id => current_user.id ,:provider_id => params[:id])
	subscription.delete_all

        render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Removed",
                      :data => { }
                    }
  end

end
