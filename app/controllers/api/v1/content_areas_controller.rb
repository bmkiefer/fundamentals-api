class Api::V1::ContentAreasController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index
	content_areas = ContentArea.all
	
	render :status => 200,
           :json => { :success => true,
                      :info => "List of Content Areas",
                      :data => {
                                   "content_areas" => content_areas
                               }
                    }
  end

  def create
        ContentArea.create(:name => params[:name])
	render :status => 200,
           :json => { :success => true,
                      :info => "Content Area Added",
                      :data => { }
                    }
  end

  def destroy
        content_area = ContentArea.find(params[:id])
	content_area.delete

        render :status => 200,
           :json => { :success => true,
                      :info => "Content Area Removed",
                      :data => { }
                    }
  end

end
