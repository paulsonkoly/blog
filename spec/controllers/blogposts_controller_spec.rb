# frozen_string_literal: true

require 'byebug'

require 'rails_helper'

RSpec.describe BlogpostsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Blogpost. As you add validations to Blogpost, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:blogpost) }

  let(:invalid_attributes) do
    FactoryGirl.attributes_for(:blogpost).merge(title: '')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BlogpostsController. Be sure to keep this updated too.
  let(:logged_in_user) { FactoryGirl.create :user }
  let(:valid_session) { { user_id: logged_in_user.id } }

  describe 'GET #index' do
    it 'returns a success response' do
      Blogpost.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      blogpost = Blogpost.create! valid_attributes
      get :show, params: { id: blogpost.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end

    context 'when no user is logged in' do
      it 'denies access' do
        expect { get :new, params: {}, session: {} }.to deny_access
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      blogpost = Blogpost.create! valid_attributes
      get :edit, params: { id: blogpost.to_param }, session: valid_session
      expect(response).to be_success
    end

    context 'when no user is logged in' do
      it 'denies access' do
        expect do
          blogpost = Blogpost.create! valid_attributes
          get :edit, params: { id: blogpost.to_param }, session: {}
        end.to deny_access
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Blogpost' do
        expect do
          post(:create,
               params: { blogpost: valid_attributes },
               session: valid_session)
        end.to change(Blogpost, :count).by(1)
      end

      it 'redirects to the created blogpost' do
        post(:create,
             params: { blogpost: valid_attributes },
             session: valid_session)
        expect(response).to redirect_to(Blogpost.last)
      end

      context 'when no user is logged in' do
        it 'denies access' do
          expect do
            post :create, params: { blogpost: valid_attributes }, session: {}
          end.to deny_access
        end
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post(:create,
             params: { blogpost: invalid_attributes },
             session: valid_session)
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { FactoryGirl.attributes_for(:blogpost) }
      let(:blogpost) { Blogpost.create! valid_attributes }

      it 'updates the requested blogpost' do
        put(:update,
            params: { id: blogpost.to_param, blogpost: new_attributes },
            session: valid_session)
        blogpost.reload
        expect(blogpost.title).to eq(new_attributes[:title])
      end

      it 'redirects to the blogpost' do
        put(:update,
            params: { id: blogpost.to_param, blogpost: valid_attributes },
            session: valid_session)
        expect(response).to redirect_to(blogpost)
      end

      context 'when no user is logged in' do
        it 'denies access' do
          expect do
            put(:update,
                params: { id: blogpost.to_param, blogpost: new_attributes },
                session: {})
          end.to deny_access
        end
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        blogpost = Blogpost.create! valid_attributes
        put(:update,
            params: { id: blogpost.to_param, blogpost: invalid_attributes },
            session: valid_session)
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:blogpost) { Blogpost.create valid_attributes }

    it 'destroys the requested blogpost' do
      blogpost.save!
      expect do
        delete(:destroy,
               params: { id: blogpost.to_param },
               session: valid_session)
      end.to change(Blogpost, :count).by(-1)
    end

    it 'redirects to the blogposts list' do
      delete(:destroy,
             params: { id: blogpost.to_param },
             session: valid_session)
      expect(response).to redirect_to(blogposts_url)
    end

    context 'when no user is logged in' do
      it 'denies access' do
        expect do
          delete :destroy, params: { id: blogpost.to_param }, session: {}
        end.to deny_access
      end
    end
  end
end
