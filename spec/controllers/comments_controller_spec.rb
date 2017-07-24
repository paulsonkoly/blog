require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:blogpost) { FactoryGirl.create :blogpost }
  
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:comment)
  end
  
  let(:valid_session) { {} }
  
  describe "POST #create" do
    it "creates a new Comment" do
      expect {
        post :create,
             params: { comment: valid_attributes, blogpost_id: blogpost.to_param },
             session: valid_session
      }.to change(Comment, :count).by(1)
    end
  end
end
