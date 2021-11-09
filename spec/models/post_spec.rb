# SET UP DU WAGON

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'comment association' do
    it 'should increment comments_count' do
      post = Post.new(name: "Coffee Machine kata solved")
      post.comments << Comment.new(content: "Demo")
      post.save
      expect(Comment.count).to eq(1)
      expect(post.comments_count).to eq(1)
    end
  end

  # Description
  it "should persist a post" do
    # Act
    Post.create(name: "Difference between .tr and .sgub")
    Post.create(name: "Coffee Machine kata solved")

    # Assert
    expect(Post.count).to eq(2)
  end
end
