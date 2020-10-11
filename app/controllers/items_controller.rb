class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]

  def index
    @item = Item.all.order("created_at DESC")
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

  # def edit #編集機能で使います
  # end

  # def update #編集機能で使います
    # @items.update(item_params)
    # redirect_to root_path
  # end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :category_id, 
                                 :condition_id, :shipping_cost_id, :prefecture_id, 
                                 :estimated_shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
