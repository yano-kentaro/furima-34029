class ItemsController < ApplicationController
  def index
  end
  def new
    
  end
  def create
    
  end
  private
  def items_params
    params.require(:items).permit(
      :name, :explanation, :price, :category_id, :condition_id, :shipping_charge_id, :delivery_date_id, :prefecture_id
    ).merge(user_id: current_user.id )
  end
end
