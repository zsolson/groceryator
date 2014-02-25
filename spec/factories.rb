#FactoryGirl.define do
 # factory :user do
 #   #sequence(:name)		{ |n| "Person #{n}" }
 #   #sequence(:email)	{ |n| "person_#{n}@example.com" }
#    name "Zack Olson"
#    email "zsolson@gmail.com"
#    password "eightchar"
#    password_confirmation "eightchar"
#  end
#end

FactoryGirl.define do
  factory :user do
    sequence(:email)	{ |n| "person_#{n}@example.com" }
    password "123123123"
    password_confirmation  "123123123" 
    sequence(:name)		{ |n| "Person #{n}" }
  end
end