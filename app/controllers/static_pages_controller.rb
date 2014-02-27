class StaticPagesController < ApplicationController
  def home
  	@grocery_lists = current_user.grocery_lists.paginate(page: params[:page])
  end

  def help
  end

  def about
  end

  def contact
  end
end
