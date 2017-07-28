require 'rails_helper'

RSpec.describe "blogposts/show", type: :view do
  before(:each) do
    @blogpost = assign(:blogpost, FactoryGirl.create(:blogpost))
  end

  it "renders attributes in <p>" do
    render
    date = @blogpost.date
    expect(rendered).to match(%r{#{@blogpost.title}.*#{date.day}/#{date.month}/#{date.year}})
    expect(rendered).to match(@blogpost.content)
  end

  it "renders the comment form" do
    render

    expect(rendered).to have_form(blogpost_comments_path(blogpost_id: @blogpost.to_param), :post) do
      with_tag 'input', with: { name: 'comment[name]' }
      with_tag 'input', with: { name: 'comment[email]' }
      with_tag 'textarea', with: { name: 'comment[content]' }
    end
  end

  context 'with a comment' do
    before (:each) do
      @blogpost.comments.create(FactoryGirl.attributes_for :comment, content: 'hello')
      @comment = @blogpost.comments.first
    end

    it 'renders the comments' do
      render
      expect(rendered).to match("hello")
    end

    it 'doesn\'t output double <p> tags' do
      render
      expect(rendered).not_to match('<p><p>')
    end

    context 'with a logged in user' do
      before (:each) { allow(view).to receive(:can?).and_return(true) }

      it 'renders the edit link' do
        render
        expect(rendered).to have_tag 'a', with: {
                                       href: edit_blogpost_comment_path(blogpost_id: @blogpost.to_param,
                                                                        id: @comment.to_param) }
      end

      it 'renders the destroy link' do
        render
        expect(rendered).to have_tag 'a', with: {
                                       href: blogpost_comment_path(blogpost_id: @blogpost.to_param,
                                                                   id: @comment.to_param),
                                       "data-method": 'delete' }
      end

    end
  end
end
