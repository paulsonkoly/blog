require 'rails_helper'

RSpec.describe "blogposts/new", type: :view do
  before(:each) do
    assign(:blogpost, Blogpost.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new blogpost form" do
    render

    assert_select "form[action=?][method=?]", blogposts_path, "post" do

      assert_select "input[name=?]", "blogpost[title]"

      assert_select "textarea[name=?]", "blogpost[content]"
    end
  end
end
