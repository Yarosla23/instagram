require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  before do
    sign_in create(:user)
  end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns @users" do
      user = create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the :show template" do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it "assigns @user" do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "assigns @posts" do
      user = create(:user)
      post = create(:post, user: user)
      get :show, params: { id: user.id }
      expect(assigns(:posts)).to eq([post])
    end
  end
end
