require 'rails_helper'

RSpec.describe "layouts/application.html.erb", type: :view do

  it 'displays the alert flash' do
    flash.alert = 'Alert message'

    render
    expect(rendered).to match 'Alert message'
  end

  it 'displays the notice flash' do
    flash.notice = 'Notice message'

    render
    expect(rendered).to match 'Notice message'
  end
end
