require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      name: "MyString",
      content: "MyText",
      post: nil
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[name]"

      assert_select "textarea[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[post_id]"
    end
  end
end
