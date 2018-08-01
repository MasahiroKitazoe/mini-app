require 'rails_helper'

RSpec.describe Blog, type: :model do

  it "generates associated data from a factory" do
    blog = FactoryGirl.build(:blog)
    puts "This note's user is #{blog.user.inspect}"
  end

  it "is valid with text and user_id" do
    blog = FactoryGirl.build(:blog)
    expect(blog).to be_valid
  end

  it "is invalid without text" do
    blog = FactoryGirl.build(:blog, text: nil)

    blog.valid?
    expect(blog.errors[:text]).to include("を入力してください")
  end

  it 'prohibits users that do not sign in from posting blogs'
end
