FactoryGirl.define do
  factory :blog do
    title "We are Groot"
    text "I am Groot"
    association :user
  end
end
