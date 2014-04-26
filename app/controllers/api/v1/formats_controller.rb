class Api::V1::FormatsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  def index

         all_formats =	Format.all

	  render :status => 200,
           :json => { :success => true,
                      :info => "All Formats",
                      :data => {   
					:formats => all_formats
				 }
                    }
  end

def create

         all_formats =  Format.all.order('name desc')

          render :status => 200,
           :json => { :success => true,
                      :info => "All Formats",
                      :data => {
                                        :formats => all_formats
                                 }
                    }
  end

 # def create

#   my_format = Format.find(params[:id])


 # if my_format.hidden_flag == nil
#	my_format.update_column(:hidden_flag, true)
#  else	
#	my_format.update_column(:hidden_flag, nil)
#  end

 # render :status => 200,
 #          :json => { :success => true,
 #                     :info => "Format Visibility Toggled",
 #                     :data => { }
 #                   } 

 # end

end
