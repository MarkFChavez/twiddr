class TwiddsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource 
  
  def index
  end

  def show
  end

  def new
  end

  def create
    @twidd = current_user.twidds.build(params[:twidd])

    respond_to do |format|
      if @twidd.save
        format.html { redirect_to dashboard_path, notice: "Twidd created successfully" }
        format.json { render json: @twidd, status: :ok }
      else
        format.html do 
          @twidds = Twidd.all
          render "landing/show"
        end
        format.json { render json: @twidd, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @twidd = current_user.twidds.find(params[:id])
    @twidd.destroy

    redirect_to dashboard_path
  end
end
