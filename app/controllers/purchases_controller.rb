class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
  end

  private

  def purchase_params
    params.require()


end
