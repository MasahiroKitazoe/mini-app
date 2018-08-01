require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a nickname, email and password' do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without nickname' do
    user = FactoryGirl.build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end

  it 'is invalid without email address' do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it 'is invalid without password' do
    user = FactoryGirl.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
end
