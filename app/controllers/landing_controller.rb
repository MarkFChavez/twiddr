class LandingController < ApplicationController
  before_filter :authenticate_user!, except: :index 
  
  def index
  	redirect_to dashboard_path if user_signed_in?
  end

  def show
  	@twidds = Twidd.from_users_followed_by(current_user)
  	@twidd = Twidd.new
    @followers = current_user.followers
    
  end

  def search
  	if !params[:search] or params[:search].empty?
  		@search_result = []
  	else
  		@search_result = User.search(params[:search])
  		@search_result = @search_result.select { |hash| hash[:id] != current_user.id }
  	end
  end
end
