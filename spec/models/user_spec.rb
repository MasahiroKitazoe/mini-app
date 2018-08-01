require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a nickname, email and password' do
    user = User.new(
      nickname: "groot",
      email: "iamgroot@gmail.com",
      password: "iamgroot"
      )

    expect(user).to be_valid
  end

  it 'is invalid without nickname' do
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end

  it 'is invalid without email address' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it 'is invalid without password' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
end
