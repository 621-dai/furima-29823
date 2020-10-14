require 'rails_helper'
describe PurchaseShipping do
  before do
    @purchase_shipping = FactoryBot.build(:purchase_shipping)
  end

  describe '購入プロセス' do
    context '購入プロセスがうまくいくとき' do
      it 'カード情報、有効期限、CVC、郵便番号、都道府県、市区町村、番地、建物名、電話番号が存在すれば登録できる' do
        expect(@purchase_shipping).to be_valid
      end
    end


    context '新規会員登録がうまくいかないとき' do
      it "カード情報（Token）が空だと登録できない" do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空だと登録できない" do
        @purchase_shipping.postal_code = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it "郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと" do
        @purchase_shipping.postal_code = 0000000
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "都道府県のidが0だと登録できない" do
        @purchase_shipping.prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture is invalid")
      end

      it "市区町村が空だと登録できない" do
        @purchase_shipping.city = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空だと登録できない" do
        @purchase_shipping.street_name = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Street name can't be blank")
      end

      it "建物名は空でも登録できる" do
        @purchase_shipping.building = nil
        expect(@purchase_shipping).to be_valid
      end

      it "電話番号が空だと登録できない" do
        @purchase_shipping.phone_number = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input half-width numbers.")
      end

      it "電話番号が半角数字出ないと登録できない" do
        @purchase_shipping.phone_number = "００００００００"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
      end
    end
  end
end


