require 'rails_helper'
require 'devise'

RSpec.describe UsersController, type: :controller do
    describe 'GET #index' do
      it 'assigns all users to @users' do
        user1 = create(:user)
        user2 = create(:user)
        
        get :index
        
        expect(assigns(:users)).to match_array([user1, user2])
      end
      
      it 'renders the index template' do
        get :index
        
        expect(response).to render_template(:index)
      end
    end
  
    describe 'GET #show' do
      let(:user) { create(:user) }
      
      it 'assigns the requested user to @user' do
        get :show, params: { id: user.id }
        
        expect(assigns(:user)).to eq(user)
      end
      
      it 'assigns the user posts to @posts' do
        post1 = create(:post, user: user)
        post2 = create(:post, user: user)
        
        get :show, params: { id: user.id }
        
        expect(assigns(:posts)).to match_array([post1, post2])
      end
      
      it 'renders the show template' do
        get :show, params: { id: user.id }
        
        expect(response).to render_template(:show)
      end
    end
  end
