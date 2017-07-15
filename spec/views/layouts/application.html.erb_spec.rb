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

  describe 'login/logout menu' do
    context 'without a logged in user' do
      it 'displays the log in link' do
        render
        expect(rendered).to match 'Login'
      end
    end

    context 'with a logged in user' do
      let (:user) { FactoryGirl.create :user }
      before(:each) do
        controller.helpers.login(user)
      end
    
      it 'displays the logged in user\'s name' do
        render
        expect(rendered).to match "Logout #{user.name}"
      end
    end
  end
end
