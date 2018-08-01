require 'rails_helper'

RSpec.describe Blog, type: :model do

  before do
    @user = User.create(
      nickname: "groot",
      email: "iamgroot@gmail.com",
      password: "iamgroot"
      )
  end

  it "is valid with text and user_id" do
    blog = Blog.new(
      text: "I am Groot",
      user: @user,
      )

    expect(blog).to be_valid
  end

  it "is invalid without text" do
    blog = Blog.new(text: nil)

    blog.valid?
    expect(blog.errors[:text]).to include("を入力してください")
  end

  it 'prohibits users that do not sige in from posting blogs'
end
