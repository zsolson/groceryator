class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :grocery_lists, dependent: :destroy
  validates :name, presence: true

  def todays_lists
  	grocery_lists.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def next_grocery_list_name
  	count = todays_lists.count
  	if count != 0
  		"My Grocery list #{Time.now.strftime("%m/%d/%Y")} (#{count + 1})"
  	else
  		"My Grocery list #{Time.now.strftime("%m/%d/%Y")}"
  	end
  end
end
