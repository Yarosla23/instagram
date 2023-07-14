require 'rails_helper'
RSpec.describe FollowsController, type: :controller do
    let(:user) { create(:user) } # Создаем фабрику для генерации тестового пользователя
    let(:current_user) { create(:user) } # Создаем фабрику для генерации текущего пользователя
    before do
        sign_in create(:user)

      end
    
    # Тест на создание подписки
    describe "POST #create" do
      context "with valid attributes" do
        it "creates a new follow" do
          expect {
            post :create, params: { user_id: user.id }, session: { user_id: current_user.id }
          }.to change(Follow, :count).by(1)
        end
  
        it "redirects to the followed user" do
          post :create, params: { user_id: user.id }, session: { user_id: current_user.id }
          expect(response).to redirect_to user
        end
      end
  
      # Тест на повторное подписание
      context "when already following" do
        before { current_user.follows.create(followed_user: user) }
  
        it "does not create a new follow" do
          expect {
            post :create, params: { user_id: user.id }, session: { user_id: current_user.id }
          }.not_to change(Follow, :count)
        end
  
        it "redirects to the followed user" do
          post :create, params: { user_id: user.id }, session: { user_id: current_user.id }
          expect(response).to redirect_to user
        end
      end
    end
  
    # Тест на удаление подписки
    describe "DELETE #destroy" do
      before { current_user.follows.create(followed_user: user) }
      let(:destroy_params) { { id: user.id } }
  
      it "destroys the follow" do
        expect {
          delete :destroy, params: destroy_params, session: { user_id: current_user.id }
        }.to change(Follow, :count).by(-1)
      end
  
      it "redirects to the followed user" do
        expect(response).to redirect_to user
    end
  end
end