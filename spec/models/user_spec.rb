require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'devise modules' do
    it 'includes database_authenticatable module' do
      expect(User.devise_modules).to include(:database_authenticatable)
    end

    it 'includes registerable module' do
      expect(User.devise_modules).to include(:registerable)
    end

    it 'includes recoverable module' do
      expect(User.devise_modules).to include(:recoverable)
    end

    it 'includes rememberable module' do
      expect(User.devise_modules).to include(:rememberable)
    end

    it 'includes validatable module' do
      expect(User.devise_modules).to include(:validatable)
    end
  end

  describe 'associations' do
    it 'has many follows with dependent destroy' do
      association = User.reflect_on_association(:follows)
      expect(association.macro).to eq :has_many
      expect(association.options).to include(dependent: :destroy)
    end

    it 'has many followed_users through follows with dependent destroy' do
      association = User.reflect_on_association(:followed_users)
      expect(association.macro).to eq :has_many
      expect(association.options).to include(dependent: :destroy)
    end

    it 'has many following_users with dependent destroy' do
      association = User.reflect_on_association(:following_users)
      expect(association.macro).to eq :has_many
      expect(association.options).to include(dependent: :destroy)
    end

    it 'has many followers through following_users with dependent destroy' do
      association = User.reflect_on_association(:followers)
      expect(association.macro).to eq :has_many
      expect(association.options).to include(dependent: :destroy)
    end

    it 'has many posts' do
      association = User.reflect_on_association(:posts)
      expect(association.macro).to eq :has_many
    end

    it 'has many comments' do
      association = User.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end

    it 'has many likes' do
      association = User.reflect_on_association(:likes)
      expect(association.macro).to eq :has_many
    end
  end
end
