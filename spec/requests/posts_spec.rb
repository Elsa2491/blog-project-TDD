require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe "Posts", type: :request do
  current_user = User.first_or_create(first_name: "example", email: "example@test.com", password: "example")

  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => 'Test',
      'body' => '12345'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'name' => '1',
      'body' => '.'
    }
  end

  describe "Posts routes" do
    it "renders 'posts/index'" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "renders 'post/show'" do
      get '/posts/:id'
      expect(response).to have_http_status(200)
    end
  end


    it "GET /index" do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get root_path
      expect(response).to be_successful
    end

    it "created a post" do
      post = Post.create(valid_attributes)
      post.user = current_user
      post.save
      get post_path(post)
      expect(response).to be_successful
    end
  #end
end

