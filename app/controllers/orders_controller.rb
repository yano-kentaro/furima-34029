class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new
  end
  def create
    @address_order = AddressOrder.new(address_order_params)
    if @address_order.valid?
      @address_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_order_params
    params.require(:address_order).permit(:postcode, :city, :address_line_1, :address_line_2, :phone_number, :prefecture_id)
  end
end
