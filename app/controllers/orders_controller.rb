
class OrdersController < ApplicationController
  before_action :set_orders, only: %i[ show create ]

  def show
  end

  def index

  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.wizard = @wizard

    if @order.save
      redirect_to wizard_path(@wizard)
    else
      render :new
    end
  end

  private

  def orders
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:amount, :start_date, :end_date)
  end

end

