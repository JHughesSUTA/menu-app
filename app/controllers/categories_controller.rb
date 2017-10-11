class CategoriesController < ApplicationController
  def create
    category = Category.new(
      id: params["id"],
      name: params["category_name"]
    )

    if category.save
      flash[:success] = "#{category.name} has been added to categories"
      redirect_to :back
    else
      flash[:warning] = "category name is invalid"
      redirect_to :back
    end
  end

  def destroy
    category_id = params[:id]
    category = Category.find_by(id: category_id)
    category_items = category.items.where(category_id: category_id)
    category_items.destroy_all
    category.destroy
    flash[:success] = "#{category.name} has been removed from the menu"
    redirect_to :back
  end
end