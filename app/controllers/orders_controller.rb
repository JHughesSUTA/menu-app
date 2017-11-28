class OrdersController < ApplicationController
  def create
    order = Order.new(user_id: current_user.id)
    order.save

    carted_items = current_user.carted_items.where(status: "carted")
    carted_items.update_all(
      status: "purchased",
      order_id: order.id 
    )

    order.order_totals #model method to calculate totals

    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end