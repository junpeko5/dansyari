class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      flash[:success] = 'Itemが正常に登録されました'
      redirect_to @item
    else
      flash.now[:danger] = 'Itemが登録されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = 'Item は正常に更新されました'
      redirect_to @item
    else
      flash.now[:danger] = 'Item は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:success] = 'Itemは正常に削除されました。'
    redirect_to root_path
  end
  
  private
  
  def set_item
    @item = current_user.items.find_by(id: params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :content, :image)
  end
end
