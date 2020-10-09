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

  def show
  end

  def edit
  end

  def update
    @items.update(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :category_id, 
                                 :condition_id, :shipping_cost_id, :prefecture_id, 
                                 :estimated_shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
