class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :move_to_root

  def index
      @item = Item.find(params[:item_id])
      @item_purchase = ItemPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def move_to_root
    @purchase = Purchase.find(params[:item_id])
    unless @purchase.blank?
      redirect_to root_path
    end
  end
end

