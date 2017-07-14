require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it 'renders the login form' do
    render

    expect(rendered).to have_form(sessions_path, :post) do
      with_tag 'input', with: { name: 'session[user_name]' }
      with_tag 'input', with: { name: 'session[user_password]', type: 'password' }
    end
  end
end
