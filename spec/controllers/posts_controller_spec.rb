require 'rails_helper'
RSpec.describe PostsController, type: :controller do
    let(:invalid_attributes) {
      { title: nil }
    }
    let(:valid_session) { {} }
  
    before do
        sign_in create(:user)
      end
    
  
    describe "GET #index" do
      it "returns a success response" do
        post = create(:post)
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
  
      it "assigns all posts as @posts" do
        post1 = create(:post)
        post2 = create(:post)
        get :index, params: {}, session: valid_session
        expect(assigns(:posts)).to eq([post1, post2])
      end
    end
  
    describe "GET #show" do
      let(:post) { create(:post) }
  
      it "returns a success response" do
        get :show, params: { id: post.to_param }, session: valid_session
        expect(response).to be_successful
      end
  
      it "assigns the requested post as @post" do
        get :show, params: { id: post.to_param }, session: valid_session
        expect(assigns(:post)).to eq(post)
      end
  
      it "builds a new comment for the post" do
        get :show, params: { id: post.to_param }, session: valid_session
        expect(assigns(:comment)).to be_a_new(Comment)
        expect(assigns(:comment).post).to eq(post)
      end
    end
  
    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
  
      it "assigns a new post as @post" do
        get :new, params: {}, session: valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end
    end   
end