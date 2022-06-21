class Admin::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page]).per(3)
  end

  def new
    @item=Item.new
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
     @item=Item.find(params[:id])
  end
  
  def update
    @item=Item.find(params[:id])
    @item.update!(item_params)
    redirect_to admin_item_path(params[:id])
  end
  
  def create
    @items = Item.new(item_params)
    @items.save
    redirect_to admin_item_path(@items)
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id)
  end
end
