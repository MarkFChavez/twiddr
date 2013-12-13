class RelationshipsController < ApplicationController
  before_filter :authenticate_user! 

  def create
  	@user = User.find(params[:id])
  	@followed = current_user.relationships.build(followed_id: params[:id])

  	respond_to do |format|
  		if @followed.save
  			format.html { redirect_to dashboard_path, notice: "You have successfully followed #{@user.name}" }
  			format.json { render json: @followed, status: :ok }
  		else
  			format.html { redirect_to dashboard_path, alert: "Error occurred while following #{@user.name}" }
  			format.json { render json: @followed, status: :unprocessable_entity }
  		end
  	end
  end

  def destroy
  end
end
