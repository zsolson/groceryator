class GroceryListItemsController < ApplicationController
  def new
  	groceryList = GroceryList.find(params[:grocery_list_id])
  	if groceryList.nil?
  		redirect_to root_url
  	end
  	@groceryListItem = groceryList.grocery_list_items.build
  	@groceryListItem.build_item
  end

  def create
  	grocery_list_items_params
  	@groceryList = GroceryList.find(params[:grocery_list_id])
  	if @groceryList.nil?
  		redirect_to root_url
  	end
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

  def destroy
  end


  private

  def save_grocery_list_item
	@grocery_list_item = GroceryListItem.new
	@grocery_list_item.grocery_list = @groceryList
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

  def grocery_list_items_params
  	params.require(:grocery_list_id)
    params.permit(:grocery_list_item => [ :item => [:name]])
  end
end
