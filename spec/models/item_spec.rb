require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context "出品商品が保存できる場合" do
      it "全ての項目を満たしていれば出品商品は保存される" do
        expect(@item).to be_valid
      end
    end
    context "出品商品が保存できない場合" do
      it "商品名がない出品商品は保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明文がない出品商品は保存できない" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "商品画像のない出品商品は保存できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品の状態が入力されていないと出品商品は保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "商品のカテゴリーが入力されていないと出品商品は保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "送料負担が入力されていないと出品商品は保存できない" do
        @item.postage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "発送元の地域が入力されていないと出品商品は保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送にかかる日数が入力されていないと出品商品は保存できない" do
        @item.days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it "価格が入力されていないと出品商品は保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

