class GroceryListsController < ApplicationController
  def new
    @groceryList = current_user.grocery_lists.build(name: current_user.next_grocery_list_name)
  end

  def create
    @groceryList = current_user.grocery_lists.build(grocery_list_params)
    if @groceryList.save
      flash[:success] = "Grocery List Created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private 

  def grocery_list_params
    params.require(:grocery_list).permit(:name)
  end
end
