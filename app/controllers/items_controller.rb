class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def items_params
    params.require(:item).permit(
      :image, :name, :explanation, :price, :category_id, :condition_id, :shipping_charge_id, :delivery_date_id, :prefecture_id
    ).merge(user_id: current_user.id )
  end
end
