class StaticPagesController < ApplicationController
  def home
  	@grocery_lists = current_user.active_grocery_lists.paginate(page: params[:page]) if user_signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
