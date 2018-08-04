FactoryGirl.define do
  factory :user do
    nickname "groot"
    sequence(:email) { |n| "iamgroot#{n}@gmail.com" }
    password "iamgroot"
  end
end
