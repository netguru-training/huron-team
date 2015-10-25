FactoryGirl.define do
  factory :bar do
    name Faker::Commerce.name 
    lat 50.50 
    lng 39.39
    city Faker::Commerce.name
    street Faker::Commerce.name 
    user nil
  end
end
