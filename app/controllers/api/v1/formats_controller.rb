class Api::V1::FormatsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index

	Format.all

	  render :status => 200,
           :json => { :success => true,
                      :info => "All Formats",
                      :data => {   
					:formats => all_formats
				 }
                    }
  end

  def show

  if params[:hidden_flag] == 1
	Format.find(params[:id]).update_column(:hidden_flag, true)
  else	
	Format.find(params[:id]).update_column(:hidden_flag, nil)
  end

  render :status => 200,
           :json => { :success => true,
                      :info => "Format Visibility Toggled",
                      :data => { }
                    } 

  end

end
