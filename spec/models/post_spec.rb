# SET UP DU WAGON

require 'rails_helper'

RSpec.describe Post, type: :model do
  it "should persist a post" do
    Post.create(name: "Difference between .tr and .sgub")
    Post.create(name: "Coffee Machine kata solved")
    expect(Post.count).to eq(2)
  end
end
