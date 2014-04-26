class Api::V1::FormatsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index

         all_formats =	Format.all.order('name asc')

	  render :status => 200,
           :json => { :success => true,
                      :info => "All Formats",
                      :data => {   
					:formats => all_formats
				 }
                    }
  end
end
