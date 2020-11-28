class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :category_id, :condition_id, :postage_id, :shopping_prefecture_id, :days_id, :price, :user).merge(user_id: current_user.id)
end
