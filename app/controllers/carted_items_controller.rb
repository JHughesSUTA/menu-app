class CartedItemsController < ApplicationController
  def index
    @carted_items = current_user.carted_items.where(status: "carted")
    # @carted_item = CartedItem.new
    if @carted_items.length > 0 
      render "index.html.erb"
    else 
      flash[:warning] = "You have no items in your order"
      redirect_to "/"
    end
  end

  def create
    carted_item = CartedItem.new(
      quantity: params[:quantity],
      item_id: params[:item_id],
      user_id: current_user.id,
      status: "carted"
    )
    if carted_item.save
      redirect_to "/menu"
    else
      flash[:warning] = "Quantity is invalid"
      redirect_to "/menu"
    end
  end

  def destroy
    carted_item = CartedItem.find_by(id: params[:id])
    carted_item.status = "removed"
    carted_item.save
    flash[:succes] = "'#{carted_item.item.name}' has been removed"
    redirect_to "/"
  end
end