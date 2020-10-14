class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)  
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.permit(:purchased_id, :postal_code, :prefecture_id, :city, :building, :street_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

