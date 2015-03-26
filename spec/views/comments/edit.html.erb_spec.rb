require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :content => "MyText",
      :post_id => 1,
      :author_id => 1,
      :approved => false
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "textarea#comment_content[name=?]", "comment[content]"

      assert_select "input#comment_post_id[name=?]", "comment[post_id]"

      assert_select "input#comment_author_id[name=?]", "comment[author_id]"

      assert_select "input#comment_approved[name=?]", "comment[approved]"
    end
  end
end
