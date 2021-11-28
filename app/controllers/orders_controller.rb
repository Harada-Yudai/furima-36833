class OrdersController < ApplicationController
  def index
    @buy_send = BuySend.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_send = BuySend.new(sendinfo_params)
    @item = Item.find(params[:item_id])
    if @buy_send.valid?
      pay_item
      @buy_send.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sendinfo_params
    params.require(:buy_send).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_num, :buylog_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, card: @buy_send.token, currency: 'jpy'
    )
  end
end
