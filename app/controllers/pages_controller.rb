class PagesController < ApplicationController
  def menu
    @carted_item =CartedItem.new
    # menu variables
    @categories = Category.all.sort_by {|category| category.id}

    # sets menu to dinner if past 4pm, otherwise set to lunch
    @time = Time.current
    if @time.hour >= 16
      @items = Item.where(dinner:true).sort_by {|item| item.id}
      @meal_time = "dinner"
    else
      @items = Item.where(lunch:true).sort_by {|item| item.id}
      @meal_time = "lunch"
    end

    # resets menu based on link clicked/params
    if params[:dinner] == "true"
      @items = Item.where(dinner: true).sort_by {|item| item.id}
      @meal_time = "dinner"

    elsif params[:lunch] == "true"
      @items = Item.where(lunch:true).sort_by {|item| item.id}
      @meal_time = "lunch"

    end

    # price calculation variables
    if current_user # so page loads while not logged in
      @carted_items = CartedItem.where(status: "carted", user_id: current_user.id).sort_by { |carted_item| carted_item.id }
      @subtotal = 0
      @carted_items.each do |carted_item|
        @subtotal += carted_item.quantity * carted_item.item.price
      end
      @tax = @subtotal * 0.09
      @total = @subtotal + @tax 
    end
    
    render "menu.html.erb"
  end

  def admin
    @items = Item.all.sort_by {|item| item.id}
    @categories = Category.all.sort_by {|category| category.id}
    if current_user && current_user.admin 
      render "admin.html.erb"
    else
      flash[:warning] = "You do not have access to the page"
      redirect_to "/"
    end
  end
end