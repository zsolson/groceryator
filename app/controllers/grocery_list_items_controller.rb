class GroceryListItemsController < ApplicationController
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  before_filter :load_grocery_list
  before_filter :preset_grocery_list_item, :only => :create

  load_and_authorize_resource :grocery_list
  load_and_authorize_resource :through => :grocery_list
  skip_authorize_resource :grocery_list, :only => :create
  skip_authorize_resource :only => :create
  


  def new
  	@groceryListItem = @groceryList.grocery_list_items.build
  	@groceryListItem.build_item
  end

  def create
  	#grocery_list_item_params
  	@existingItem = Item.find_by(name: params[:grocery_list_item][:item][:name])
  	if @existingItem.nil?
  		#item does not exist, create it
  		@existingItem = Item.new(name: params[:grocery_list_item][:item][:name])
  		if @existingItem.save
  			#successfully saved item, save grocery_list_item
  			save_grocery_list_item
  		else
  			#item save failed, inform user
  			render 'new'
  		end
  	else
  		#item already exists, save grocery_list_item
  		save_grocery_list_item
  	end
  end

  def buy
  	@grocery_list_item = @groceryList.grocery_list_items.find(params[:id])
  	if @grocery_list_item.update_attributes(:bought => true, :price => params[:grocery_list_item][:price])
	  	redirect_to @groceryList
	else
		flash[:form_errors] = @grocery_list_item.errors.full_messages
		flash[:original_grocery_list_item] = @grocery_list_item
		redirect_to @groceryList
	end
  end

  def put_back
  	@grocery_list_item = @groceryList.grocery_list_items.find(params[:id])
  	@grocery_list_item.update_attribute(:bought, false)
  	redirect_to @groceryList
  end


  def destroy
  	@grocery_list_item = @groceryList.grocery_list_items.find(params[:id])
  	@grocery_list_item.destroy
  	redirect_to @groceryList
  end


  private

  def get_grocery_list_item
  	@groceryList = GroceryList.find(params[:grocery_list_id])
  	if @groceryList.nil?
  		return redirect_to root_url
  	end
  	@grocery_list_item = @groceryList.grocery_list_items.find_by(id: params[:id])
  	if @grocery_list_item.nil?
  		return redirect_to @groceryList 
  	end
  end

  def save_grocery_list_item
	@grocery_list_item = GroceryListItem.new
	@grocery_list_item.grocery_list = @groceryList
	@grocery_list_item = @groceryList.grocery_list_items.new
	@grocery_list_item.item = @existingItem
  	if @grocery_list_item.save
  		#grocery_list_item successfully saved
      	flash[:success] = "Item Added!"
      	redirect_to grocery_list_path(@groceryList)
  	else
  		#grocery list item failed, inform user
  		render 'new'
  	end
  end

  def preset_grocery_list_item
  	@grocery_list_item = @groceryList.grocery_list_items.new
  end

  def grocery_list_item_params
  	params.require(:grocery_list_item).permit!
    #params.permit(:grocery_list_item => [ :item => [:name]])
  end

  def load_grocery_list
  	@groceryList = GroceryList.find(params[:grocery_list_id])
  end
end
