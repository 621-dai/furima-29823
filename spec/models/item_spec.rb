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
      it "カテゴリー情報が'--'だと登録できない" do
        @item.category_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid")
      end
      it "商品の状態が'--'だと登録できない" do
        @item.condition_id = ""
        @item.valid?
      end
      it "配送料の負担が'--'だと登録できない" do
        @item.shipping_cost_id = ""
        @item.valid?
      end
      it "発送元の地域が'--'だと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
      end
      it "発送までの日数が'--'だと登録できない" do
        @item.estimated_shipping_date_id = ""
        @item.valid?
      end
      it "販売価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300円未満だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Input half-width numbers and Price must be between ¥300 and ¥9,999,999.")
      end
      it "販売価格が10,000,000円未満だと登録できない" do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Input half-width numbers and Price must be between ¥300 and ¥9,999,999.")
      end
      it "販売価格が半角数字以外だと登録できない" do
        @item.price = "１００cvbjk０"
        @item.valid?
        expect(@item.errors.full_messages).to include("Input half-width numbers and Price must be between ¥300 and ¥9,999,999.")
      end
    end
  end
end