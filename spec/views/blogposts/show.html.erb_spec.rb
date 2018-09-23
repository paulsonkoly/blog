# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blogposts/show', type: :view do
  let(:blogpost) { FactoryGirl.create(:blogpost) }

  before { assign(:blogpost, blogpost) }

  it 'renders attributes in <p>' do
    render
    date = blogpost.date
    regexp = %r{#{blogpost.title}.*#{date.day}/#{date.month}/#{date.year}}
    expect(rendered).to match(regexp)
    expect(rendered).to match(blogpost.content)
  end

  it 'renders the comment form' do
    render

    path = blogpost_comments_path(blogpost_id: blogpost.to_param)
    expect(rendered).to have_form(path, :post) do
      with_tag 'input', with: { name: 'comment[name]' }
      with_tag 'input', with: { name: 'comment[email]' }
      with_tag 'textarea', with: { name: 'comment[content]' }
    end
  end

  context 'with a comment' do
    let(:comment) { blogpost.comments.first }

    before do
      blogpost.comments.create(FactoryGirl.attributes_for(:comment,
                                                          content: 'hello'))
    end

    it 'renders the comments' do
      render
      expect(rendered).to match('hello')
    end

    it 'doesn\'t output double <p> tags' do
      render
      expect(rendered).not_to match('<p><p>')
    end

    context 'with a logged in user' do
      before { allow(view).to receive(:can?).and_return(true) }

      it 'renders the edit link' do
        render
        path = edit_blogpost_comment_path(blogpost_id: blogpost.to_param,
                                          id: comment.to_param)
        expect(rendered).to have_tag 'a', with: { href: path }
      end

      it 'renders the destroy link' do
        render
        path = blogpost_comment_path(blogpost_id: blogpost.to_param,
                                     id: comment.to_param)
        expect(rendered).to have_tag('a',
                                     with: { href: path,
                                             'data-method': 'delete' })
      end
    end
  end
end
