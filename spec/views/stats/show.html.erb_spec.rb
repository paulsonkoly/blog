# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stats/show.html.erb', type: :view do
  it 'displays the total distance travelled' do
    render

    expect(rendered).to match(Trip.total_distance.to_s)
  end
end
