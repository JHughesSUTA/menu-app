class ItemsController < ApplicationController
  def index
    @items = Item.all.sort_by {|item| item.id}
    render "index.html.erb"
  end

  def new
    @categories = Category.all
    @item = Item.new
    if current_user && current_user.admin 
      render "new.html.erb"
    else
      flash[:warning] = "You do not have access to the page"
      redirect_to "/"
    end
  end

  def create    
    @categories = Category.all 
    @item = Item.new(
      category_id: params["category_id"],
      name: params["name"],
      description: params["description"],
      price: params["price"],
      lunch: params[:lunch],
      dinner: params[:dinner]
    )
    if @item.save
      flash[:success] = "#{@item.name} has been added to the menu"
      redirect_to "/admin"
    else
      render "new.html.erb"
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
    render "show.html.erb"
  end
    
  def edit
    @categories = Category.all
    @item = Item.find_by(id: params[:id])
    if current_user && current_user.admin
      render "edit.html.erb"
    else
      flash[:warning] = "You do not have access to the page"
      redirect_to "/"
    end
  end

  def update
    @categories = Category.all
    @item = Item.find_by(id: params[:id])
    
    if @item.update(
      name: params[:name],
      description: params[:description],
      category_id: params[:category_id],
      price: params[:price]
      )
      flash[:success] = "#{@item.name} has been updated"
      redirect_to "/admin"
    else
      render "edit.html.erb"
    end
  end

  def destroy
    item_id = params[:id]
    item = Item.find_by(id: item_id)
    item.destroy
    flash[:success] = "#{item.name} has been removed from the menu"
    redirect_to :back
  end

  def menu
    @carted_item =CartedItem.new
    # menu variables
    @categories = Category.all.sort_by {|category| category.id}

    # sets menu to dinner if past 4pm, otherwise set to lunch
    @time = Time.now
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