# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name "Mark Chavez"
  	email "markchav3z@gmail.com"
  	password "mysamplepassword"
  	password_confirmation "mysamplepassword"
  end
end
