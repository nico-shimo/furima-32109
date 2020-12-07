class PurchasesController < ApplicationController

  def index
    @item_purchase = ItemPurchase.new
  end
end
