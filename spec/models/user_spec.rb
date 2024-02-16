require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:password).is_at_least(8) }
    it { should allow_value('username').for(:username) }
    it { should_not allow_value('user name').for(:username) }
    it { should_not allow_value('user@name').for(:username) }
    it { should_not allow_value('user name!').for(:username) }
  end

  describe 'associations' do
    it { should have_many(:reservations).dependent(:destroy) }
  end

  describe 'enums' do
    it { should define_enum_for(:role).with_values(user: 0, admin: 1) }
  end

  describe 'after_initialize' do
    it 'sets the default role to user' do
      user = User.new
      expect(user.role).to eq('user')
    end
  end

  describe 'methods' do
    describe '#admin?' do
      it 'returns true if the user has admin role' do
        admin_user = FactoryBot.create(:user, :admin)
        expect(admin_user.admin?).to be_truthy
      end

      it 'returns false if the user does not have admin role' do
        user = FactoryBot.create(:user)
        expect(user.admin?).to be_falsey
      end
    end
  end
end
