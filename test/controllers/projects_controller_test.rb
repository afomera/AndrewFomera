require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @project = projects(:one)
    sign_in @user
  end

  test 'should get index' do
    get projects_url
    assert_response :success
  end

  test 'should get new' do
    get new_project_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Project.count') do
      post projects_url, params: params
    end

    assert_redirected_to project_path(Project.last)
  end

  test 'should show post' do
     get project_url(@project)
     assert_response :success
   end

   test 'should get edit' do
     get edit_project_url(@project)
     assert_response :success
   end

   test 'should update post' do
     patch project_url(@project), params: update_params
     assert_equal 'Updated Title', @project.reload.title
   end

   test 'should destroy post' do
     assert_difference('Project.count', -1) do
       delete project_url(@project)
     end

     assert_redirected_to projects_path
   end

   private

   def params(options = {})
     {
       project: project_params(options)
     }
   end

   def project_params(options)
     {
       description: 'content here for post yay!',
       title: 'my post title',
       user: User.all.sample
     }.merge(options)
   end

   def update_params
     params(title: 'Updated Title')
   end
end
