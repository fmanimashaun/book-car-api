require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'validates presence of username' do
    user.username = nil
    expect(user).not_to be_valid
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'validates presence of name' do
    user.name = nil
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'validates presence of email' do
    user.email = nil
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'validates format of username' do
    user.username = 'invalid username'
    expect(user).not_to be_valid
    expect(user.errors[:username]).to include(User::USERNAME_INVALID_MESSAGE)
  end

  it 'validates format of password' do
    user.password = 'invalidpassword'
    user.password_confirmation = 'invalidpassword'
    expect(user).not_to be_valid
    expect(user.errors[:password]).to include(User::PASSWORD_INVALID_MESSAGE)
  end

  it 'has many reservations' do
    expect(user).to respond_to(:reservations)
  end

  it 'has a default role of user' do
    expect(user.role).to eq('user')
  end
end
