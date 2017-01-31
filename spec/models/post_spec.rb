require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "bob", last_name: "smith")
      @post = @user.posts.create(date: Date.today, rationale: "test rationaile")
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it " cannt be created without a date and rationale" do
      @post.date= nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
