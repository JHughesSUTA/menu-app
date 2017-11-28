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
end