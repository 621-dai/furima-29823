require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it '出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格' do
        expect(@user).to be_valid
      end
    end

    context '新規会員登録がうまくいかないとき' do
      it "出品画像が空だと登録できない" do
        @item.image = ""
        @item.valid?
      end
      it "商品名が空だと登録できない" do
        @item.introduction = ""
        @item.valid?
      end
      it "商品の説明が空だと登録できない" do
        @item.category_id = ""
        @item.valid?
      end
      it "カテゴリー情報が空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "商品の状態が空だと登録できない" do
        @item.category_id = ""
        @item.valid?
      end
      it "配送料の負担が空だと登録できない" do
        @item.shipping_cost_id = ""
        @item.valid?
      end
      it "発送元の地域が空だと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
      end
      it "発送までの日数が空だと登録できない" do
        @item.estimated_shipping_date_id = ""
        @item.valid?
      end
      it "販売価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
      end
    end
  end
end