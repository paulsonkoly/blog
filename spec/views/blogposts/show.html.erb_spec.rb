require 'rails_helper'

RSpec.describe "blogposts/show", type: :view do
  before(:each) do
    @blogpost = assign(:blogpost, Blogpost.create!(
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    date = @blogpost.created_at
    expect(rendered).to match(%r{Title.*#{date.day}/#{date.month}/#{date.year}})
    expect(rendered).to match(/MyText/)
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
    end

    it 'renders the comments' do
      render
      expect(rendered).to match("hello")
    end

    it 'doesn\'t output double <p> tags' do
      render
      expect(rendered).not_to match('<p><p>')
    end
  end
end
