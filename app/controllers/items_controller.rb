class ItemsController < ApplicationController
  def index
  end

  def new
    @iyem = Item.new
  end

  def create
  end


  private

def prototype_params
  params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :ship_pay_id,:prefecture_id,:ship_day_id).merge(user_id: current_user.id)
end
end
 