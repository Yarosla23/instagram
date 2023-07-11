require 'rails_helper'

RSpec.describe Post, type: :model do
    describe 'validations' do
      it 'validates presence of title' do
        post = Post.new(description: 'Lorem ipsum', tags: ['tag1', 'tag2'])
        expect(post).not_to be_valid
        expect(post.errors[:title]).to include("can't be blank")
      end
  
      it 'validates presence of description' do
        post = Post.new(title: 'My Post', tags: ['tag1', 'tag2'])
        expect(post).not_to be_valid
        expect(post.errors[:description]).to include("can't be blank")
      end
  
      it 'validates presence of tags' do
        post = Post.new(title: 'My Post', description: 'Lorem ipsum')
        expect(post).not_to be_valid
        expect(post.errors[:tags]).to include("can't be blank")
      end
  
      it 'is valid with all required fields' do
        post = Post.new(title: 'My Post', description: 'Lorem ipsum', tags: ['tag1', 'tag2'])
        expect(post).to be_valid
      end
    end
  end