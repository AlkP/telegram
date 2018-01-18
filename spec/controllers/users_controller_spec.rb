require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  before { sign_in(admin) }

  describe 'GET #index' do
    let(:users) { create_list(:user, 10) }
    before { get :index }

    it 'populates an array of all users' do
      expect(assigns(:users)).to match_array(User.all.first(9))
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'DELETE #destroy' do
    it 'Change status user' do
      delete :destroy, params: { id: user }
      user.reload
      expect(user.status).to eq 'archive'

      delete :destroy, params: { id: user }
      user.reload
      expect(user.status).to eq 'active'
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: user }
      expect(response).to redirect_to users_path
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: user } }

    it 'assigns a edit user to @user' do
      expect(assigns(:user)).to eq user
    end

    it 'render new view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'change user attributes' do
        patch :update, params: { id: user, user: { email: 'new@test.ru' } }
        user.reload
        expect(user.email).to eq 'new@test.ru'
      end

      it 'redirects to the root path' do
        patch :update, params: { id: user, user: attributes_for(:user) }
        expect(response).to redirect_to users_path
      end
    end
  end
end
