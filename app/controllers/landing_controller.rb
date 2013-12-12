class LandingController < ApplicationController
  before_filter :authenticate_user!, except: :index 
  
  def index
  	redirect_to dashboard_path if user_signed_in?
  end

  def show
  end
end
