FactoryGirl.define do
  factory :blog do
    text "I am Groot"
    association :user
  end
end
