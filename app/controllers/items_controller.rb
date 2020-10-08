class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end
 
  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @item.valid?
       @items.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id)
  end

end
