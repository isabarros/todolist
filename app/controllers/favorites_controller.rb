class FavoritesController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    current_user.favorites_lists << @list
    render nothing: true
  end

  def destroy
  end
end
