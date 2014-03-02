class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :grocery_lists, dependent: :destroy
  validates :name, presence: true

  def todays_lists
  	grocery_lists.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def active_grocery_lists
	grocery_lists.where(:complete => false)
  end

  def completed_grocery_lists
  	grocery_lists.where(:complete => true)
  end

  def next_grocery_list_name
  	count = todays_lists.count
  	if count != 0
  		"My Grocery List #{Time.now.strftime("%m/%d/%Y")} (#{count + 1})"
  	else
  		"My Grocery List #{Time.now.strftime("%m/%d/%Y")}"
  	end
  end
end
