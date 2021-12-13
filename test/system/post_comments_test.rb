require "application_system_test_case"

class PostCommentsTest < ApplicationSystemTestCase
  setup do
    @post_comment = post_comments(:one)
  end

  test "visiting the index" do
    visit post_comments_url
    assert_selector "h1", text: "Post Comments"
  end

  test "creating a Post comment" do
    visit post_comments_url
    click_on "New Post Comment"

    fill_in "Comment", with: @post_comment.comment
    fill_in "Post", with: @post_comment.post_id
    fill_in "User", with: @post_comment.user_id
    click_on "Create Post comment"

    assert_text "Post comment was successfully created"
    click_on "Back"
  end

  test "updating a Post comment" do
    visit post_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @post_comment.comment
    fill_in "Post", with: @post_comment.post_id
    fill_in "User", with: @post_comment.user_id
    click_on "Update Post comment"

    assert_text "Post comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Post comment" do
    visit post_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post comment was successfully destroyed"
  end
end
