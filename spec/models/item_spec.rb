require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it '出品画像、商品名、商品の説明、カテゴリー、商品の状態、
          配送料の負担、発送元の地域、発送までの日数、販売価格' do
        expect(@item).to be_valid
      end
    end

    context '新規会員登録がうまくいかないとき' do
      it "出品画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空だと登録できない" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "カテゴリー情報が空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーidが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid")
      end
      it "商品の状態が空だと登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "商品idが1だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is invalid")
      end
      it "配送料の負担が空だと登録できない" do
        @item.shipping_cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it "配送料の負担idが1だと登録できない" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost is invalid")
      end
      it "発送元の地域が空だと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域がidが0だと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is invalid")
      end
      it "発送までの日数が空だと登録できない" do
        @item.estimated_shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end
      it "発送までの日数idが1だと登録できない" do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date is invalid")
      end
      it "販売価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300円未満だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers and Price must be between ¥300 and ¥9,999,999.")
      end
      it "販売価格が10,000,000円未満だと登録できない" do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers and Price must be between ¥300 and ¥9,999,999.")
      end
      it "販売価格が半角数字以外だと登録できない" do
        @item.price = "１００cvbjk０"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers and Price must be between ¥300 and ¥9,999,999.")
      end
    end
  end
end