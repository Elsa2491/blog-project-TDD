require 'rails_helper'


RSpec.describe "UserLogins", type: :request do

  describe "GET /login" do
    it "works! (now write some real specs)" do
      get login_path
      expect(response).to have_http_status(200)
    end

    it "login with invalid information" do
      get login_path
      render_template 'sessions/new'
      post login_path, params: { session: {email: "", password: ""} }
      render_template 'sessions/new'
      expect(flash[:danger]).not_to eq(flash.empty?)
      get root_path
      assert flash.empty?
    end
  end

end
