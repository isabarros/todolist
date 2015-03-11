class FavoritesController < ApplicationController
  def create
    @favorite_list = List.find(params[:list_id])
    current_user.favorites_lists << @favorite_list
    respond_to do |format|
    	if current_user.save!
    		format.js
    	else
    		format.json { render json: current_user.errors }
    	end	
    end
  end

  def destroy
  	@favorite_list = List.find(params[:id])
  	current_user.favorites_lists.delete(@favorite_list)
    respond_to do |format|
      format.js
    end
  end
end
