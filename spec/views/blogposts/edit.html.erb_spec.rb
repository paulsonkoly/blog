# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blogposts/edit', type: :view do
  let(:blogpost) { FactoryBot.create(:blogpost) }

  before { assign(:blogpost, blogpost) }

  it 'renders the edit blogpost form' do
    render

    assert_select 'form[action=?][method=?]', blogpost_path(blogpost), 'post' do
      assert_select 'input[name=?]', 'blogpost[title]'

      assert_select 'textarea[name=?]', 'blogpost[content]'
    end
  end
end
