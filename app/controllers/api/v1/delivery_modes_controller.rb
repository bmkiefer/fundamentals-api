class Api::V1::DeliveryModesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
	delivery_modes = DeliveryMode.all
	
	render :status => 200,
           :json => { :success => true,
                      :info => "List of Delivery Modes",
                      :data => {
                                   "delivery_modes" => delivery_modes
                               }
                    }
  end

  def create
        DeliveryMode.create(:name => params[:name])
	render :status => 200,
           :json => { :success => true,
                      :info => "Delivery Mode Added",
                      :data => { }
                    }
  end

  def destroy
        delivery_mode = DeliveryMode.find(params[:id])
	delivery_mode.delete

        render :status => 200,
           :json => { :success => true,
                      :info => "Delivery Mode Removed",
                      :data => { }
                    }
  end

end
