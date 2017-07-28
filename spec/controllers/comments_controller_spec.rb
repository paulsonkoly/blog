require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:blogpost) { FactoryGirl.create :blogpost }
  
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:comment)
  end

  let(:invalid_attributes) do
    FactoryGirl.attributes_for(:comment).merge(email: '')
  end

  before (:each) do
    @comment = FactoryGirl.create :comment, blogpost: blogpost
  end

  let(:logged_in_user) { FactoryGirl.create :user }
  let(:logged_in_session) { { user_id: logged_in_user.id } }
  
  describe "POST #create" do
    it "creates a new Comment" do
      expect {
        post :create,
             params: { comment: valid_attributes, blogpost_id: blogpost.to_param },
             session: {}
      }.to change(Comment, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit,
          params: {id: @comment.to_param, blogpost_id: blogpost.to_param},
          session: logged_in_session
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge content: 'hello'
      }

      it "updates the requested comment" do
        put :update,
            params: { id: @comment.to_param,
                      blogpost_id: blogpost.to_param,
                      comment: new_attributes },
            session: logged_in_session
        @comment.reload
        expect(@comment.content).to eq('hello')
      end

      it "redirects to the blogpost" do
        put :update,
            params: { id: @comment.to_param,
                      blogpost_id: blogpost.to_param,
                      comment: valid_attributes },
            session: logged_in_session
        expect(response).to redirect_to(@comment.blogpost)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update,
            params: { id: @comment.to_param,
                      blogpost_id: blogpost.to_param,
                      comment: invalid_attributes },
            session: logged_in_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      expect {
        delete :destroy,
               params: { id: @comment.to_param, blogpost_id: blogpost.to_param},
               session: logged_in_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the blogpost" do
      delete :destroy,
             params: { id: @comment.to_param, blogpost_id: blogpost.to_param},
             session: logged_in_session
      expect(response).to redirect_to(blogpost)
    end
  end
end
