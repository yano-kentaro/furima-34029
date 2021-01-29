class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_order_params)
    if @address_order.valid?
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
    redirect_to root_path unless @item.order.nil?
  end

  def address_order_params
    params.require(:address_order).permit(
      :postcode, :city, :address_line_1, :address_line_2, :phone_number, :prefecture_id
    ).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_order_params[:token],
      currency: 'jpy'
    )
  end
end
