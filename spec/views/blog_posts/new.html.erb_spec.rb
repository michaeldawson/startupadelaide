require 'spec_helper'

describe "blog_posts/new" do
  before(:each) do
    assign(:blog_post, stub_model(BlogPost,
      :title => "MyString",
      :body => "MyText",
      :admin_user => nil
    ).as_new_record)
  end

  it "renders new blog_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blog_posts_path, "post" do
      assert_select "input#blog_post_title[name=?]", "blog_post[title]"
      assert_select "textarea#blog_post_body[name=?]", "blog_post[body]"
      assert_select "input#blog_post_admin_user[name=?]", "blog_post[admin_user]"
    end
  end
end
