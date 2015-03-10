class FavoritesController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    current_user.favorites_lists << @list
    respond_to do |format|
    	if current_user.save!
    		format.js
    	else
    		format.json { render json: current_user.errors }
    	end	
    end
  end

  def destroy
  end
end
