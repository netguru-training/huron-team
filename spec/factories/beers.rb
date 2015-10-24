FactoryGirl.define do
  factory :beer do
    name Faker::Commerce.name
    kind Faker::Commerce.color
    rating 1
  end

end
