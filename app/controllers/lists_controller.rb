class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  def index
    @lists = List.where(user: current_user).decorate
    @public_lists = List.public_lists
    @favorite_lists = Favorite.where(user: current_user).map{|favorite| favorite.list }
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'A lista foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'A lista foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'A lista foi removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  def publish
    @list.update_attribute(:public, true)
    respond_to do |format|
      if @list.save
        format.js
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def unpublish
    @list.update_attribute(:public, false)
    respond_to do |format|
      if @list.save
        format.js
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      result_params = params.require(:list).permit(:name)
      result_params['user_id'] = current_user.id
      result_params
    end
end
