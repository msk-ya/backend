class OrdersController < ApplicationController
  def index
    orders = Order.all.rent
    render json: orders
  end
  
  def create
    order = Order.new( order_parameter )
    if order.save
      render json: {message: '登録しました。'}
    else
      render json: {message: '失敗しました。'}
    end
  end

  def update
    order = Order.find( params[:id] )
    if order.update_attributes( order_parameter )
      render json: {message: '登録しました。'}
    else
      render json: {message: '失敗しました。'}
    end
  end

  def destroy
    order = Order.find( params[:id] )
    order.destroy
    render json: {message: '削除しました。'}
  end


private
  def order_parameter
    params.permit( :name, :price, :oder_day, :stock )
  end
  
end