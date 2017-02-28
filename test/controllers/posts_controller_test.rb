require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    sign_in @user
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: params
    end

    assert_redirected_to post_path(Post.last)
  end

  test 'should show post' do
     get post_url(@post)
     assert_response :success
   end

   test 'should get edit' do
     get edit_post_url(@post)
     assert_response :success
   end

   test 'should update post' do
     patch post_url(@post), params: update_params
     assert_equal 'Updated Title', @post.reload.title
   end

   test 'should destroy post' do
     assert_difference('Post.count', -1) do
       delete post_url(@post)
     end

     assert_redirected_to posts_path
   end

   private

   def params(options = {})
     {
       post: post_params(options)
     }
   end

   def post_params(options)
     {
       content: 'content here for post yay!',
       title: 'my post title',
       user: User.all.sample
     }.merge(options)
   end

   def update_params
     params(title: 'Updated Title')
   end
end
