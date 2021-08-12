class OrdersController < ApplicationController

  def show
  end

  def index
  end

  def new
    @wizard = Wizard.find(params[:wizard_id])
    @order = Order.new
  end

  def create
    @wizard = Wizard.find(params[:wizard_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.wizard = @wizard

    if !@order.save
      render "wizards/show"
    end
  end

  private


  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end

end
