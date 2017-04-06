class AppsController < ApplicationController
	
	before_action :authenticate_with_token! , :except =>[:create, :index]

	def index
	@apps = App.all
	end
	
    def show
    
    @mobile_app = {
      :title => " Tutorial",
      :descr => " app",
      :rating => "*****"
    }
    #render "show.js.erb"
    end
    
    def view
        @app = App.new 
		if params[:id].present?
		id = Base64.decode64(params[:id])
		render id + ".js.erb"    
		end
    end
	
	def create
		if App.create(:email=>params[:email], :full_name=>params[:full_name])
			    render :json => "success"  and return
		else
				render :json => "error"  and return
		end
	end
	

end
