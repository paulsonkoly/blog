# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with non existent user' do
      it 'returns http success' do
        post(:create,
             params: { session: { user_name: 'nonexistent', password: '' } })
        expect(response).to be_success
      end
    end

    context 'with invallid credentials' do
      before do
        post :create, params: { session: { user_name: user.name,
                                           user_password: 'something' } }
      end

      it 'doesn\'t redirect' do
        expect(response).not_to be_a_redirect
      end

      it "doesn't set the current user" do
        expect(controller.current_user).to be_nil
      end
    end

    context 'with valid credentials' do
      before do
        post :create, params: { session: { user_name: user.name,
                                           user_password: user.password } }
      end

      it 'redirects to the root url' do
        expect(response).to redirect_to(root_url)
      end

      it 'sets current_user' do
        expect(controller.current_user).not_to be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the current user' do
      controller.login(user)
      expect { delete :destroy }.to change(controller, :current_user).to(nil)
    end

    it 'redirects to the root url' do
      delete :destroy
      expect(response).to redirect_to(root_url)
    end
  end
end
