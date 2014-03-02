class GroceryListsController < ApplicationController
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  load_and_authorize_resource

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

  def complete
    @grocery_list = GroceryList.find(params[:id])
    @grocery_list.update_attribute(:complete, true)
    redirect_to root_url
  end

  def completed_lists
    @grocery_lists = current_user.grocery_lists.where(:complete => true).paginate(page: params[:page])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @grocery_list = GroceryList.find(params[:id])
    @grocery_list_items = @grocery_list.grocery_list_items.where(:bought => false).paginate(page: params[:page])
    @bought_grocery_list_items = @grocery_list.grocery_list_items.where(:bought => true).paginate(page: params[:page])
  end

  private 

  def grocery_list_params
    params.require(:grocery_list).permit(:name)
  end
end
