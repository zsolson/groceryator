class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :grocery_lists, dependent: :destroy
  validates :name, presence: true
end
