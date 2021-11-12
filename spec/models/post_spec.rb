# SET UP DU WAGON

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'comment association' do
    it 'should increment comments_count' do
      post = build(:post)
      post.comments << build(:comment)
      post.save
      expect(Comment.count).to eq(1)
      expect(post.comments_count).to eq(1)
    end
  end

  # Description
  it "should persist a post" do
    # Act
    user = build(:user)
    user.posts << build(:post)
    user.save
    # Assert
    expect(Post.count).to eq(1)
  end
end
