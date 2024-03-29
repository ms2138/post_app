require 'rails_helper'

RSpec.describe "feeds/edit", type: :view do
  before(:each) do
    @feed = assign(:feed, Feed.create!(
      name: "MyString"
    ))
  end

  it "renders the edit feed form" do
    render

    assert_select "form[action=?][method=?]", feed_path(@feed), "post" do

      assert_select "input[name=?]", "feed[name]"
    end
  end
end
