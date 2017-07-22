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
end
