require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:elsa)
  end

  test "login with valid information" do
    get "/login"
    assert_response :success
    post login_path, params: { session: {email: @user.email, password: "password"} }
    assert_redirected_to @user
    follow_redirect!
    assert_response :success
    assert_not flash.empty?
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end


  test "login with invalid information" do
    get login_path
    assert_response :success
    post login_path, params: { session: {email: "", password: ""} }
    assert_response :success
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_response :success
    post login_path, params: { session: {email: @user.email, password: "invalid"} }
    # is_logged_in? > dans test_helper
    assert_not is_logged_in?
    assert_response :success
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    assert_response :success
    post login_path, params: { session: {email: @user.email, password: "password"} }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_response :success
    assert_not flash.empty?
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 1
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
