class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      render('devise/sessions/new')
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :postage_id, :prefecture_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end
