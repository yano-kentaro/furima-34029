class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :explanation, :price, :category_id, :condition_id, :shipping_charge_id, :delivery_date_id, :prefecture_id
    ).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
