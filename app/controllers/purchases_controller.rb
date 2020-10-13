class PurchasesController < ApplicationController
  
  def index
    @purchase = Purchase.all
    @item = Item.find(params[:item_id])
  end

  def create
    Address.create(address_params(user))
    Donation.create(donation_params(user))
    redirect_to action: :index
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :street_name, :building, 
    :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end


