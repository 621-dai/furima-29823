class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end
 
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
       @item.save
       redirect_to action: :index
    else
      render :new
    end
  end

  # def show #商品詳細機能で使います
  # end

  # def edit #編集機能で使います
  # end

  def update 
    if @item.update(item_params)
       redirect_to action: :show
    else
       render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :category_id, 
                                 :condition_id, :shipping_cost_id, :prefecture_id, 
                                 :estimated_shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
