class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(prototype_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  # @item = Item.find(params[:id])
  # end

  private

  def prototype_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :ship_pay_id, :prefecture_id, :ship_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
