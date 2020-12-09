require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '購入商品の保存' do
    context '購入商品が保存できる場合' do
      it '全ての項目を満たしていれば出品商品は保存される' do
        expect(@item_purchase).to be_valid
      end
    end
    context '購入商品が保存できない場合' do
      it '郵便番号が空、またはハイフンがないと購入商品は保存できない' do
        @item_purchase.postal_code = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1だと購入商品は保存できない' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
      end
      it 'prefecture_idが空だと購入商品は保存できない' do
        @item_purchase.prefecture_id = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
      end
      it '市町村が入力されていないと購入商品は保存できない' do
        @item_purchase.city = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end
      it '市町村が全角入力でないと購入商品は保存できない' do
        @item_purchase.city = "1"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end
      it '番地の値が空だと購入商品は保存できない' do
        @item_purchase.address = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入商品は保存できない' do
        @item_purchase.phone_number = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字でないと購入商品は保存できない' do
        @item_purchase.phone_number = "a"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end
      it '電話番号が11文字以下でないと購入商品は保存できない' do
        @item_purchase.phone_number = 111111111111
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end
    end
  end
end