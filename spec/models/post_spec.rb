require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { Post.new }

  describe 'validations' do
    it 'requires a title' do
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'requires the title to have a minimum length of 3 characters' do
      post.title = 'ab'
      post.valid?
      expect(post.errors[:title]).to include('is too short (minimum is 3 characters)')
    end

    it 'requires the title to have a maximum length of 100 characters' do
      post.title = 'a' * 101
      post.valid?
      expect(post.errors[:title]).to include('is too long (maximum is 100 characters)')
    end

    it 'requires a description' do
      post.valid?
      expect(post.errors[:description]).to include("can't be blank")
    end

    it 'requires the description to have a minimum length of 5 characters' do
      post.description = 'abcd'
      post.valid?
      expect(post.errors[:description]).to include('is too short (minimum is 5 characters)')
    end

    it 'requires the description to have a maximum length of 1000 characters' do
      post.description = 'a' * 1001
      post.valid?
      expect(post.errors[:description]).to include('is too long (maximum is 1000 characters)')
    end

    it 'requires tags' do
      post.valid?
      expect(post.errors[:tags]).to include("can't be blank")
    end

    it 'requires the tags to have a minimum length of 2 characters' do
      post.tags = 'a'
      post.valid?
      expect(post.errors[:tags]).to include('is too short (minimum is 2 characters)')
    end

    it 'requires the tags to have a maximum length of 100 characters' do
      post.tags = 'a' * 101
      post.valid?
      expect(post.errors[:tags]).to include('is too long (maximum is 100 characters)')
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should  have_many(:likes) }
    end
end
