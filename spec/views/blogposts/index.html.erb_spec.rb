# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blogposts/index', type: :view do
  before do
    assign(:blogposts,
           [FactoryBot.create(:blogpost, title: 'post-1'),
            FactoryBot.create(:blogpost, title: 'post-2')])
  end

  it 'renders a list of blogposts' do
    allow(view).to receive_messages(will_paginate: nil)

    render

    expect(rendered).to match 'post-1'
    expect(rendered).to match 'post-2'
  end
end
