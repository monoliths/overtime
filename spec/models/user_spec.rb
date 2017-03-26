require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validations" do
    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it "it requires the phone attr to only contiain integers" do
      @user.phone = "mygreatstring"
      expect(@user).to_not be_valid
    end

    it "it required the phone attr to only have 10 characters" do
      @user.phone = "12345678900"
      expect(@user).to_not be_valid
    end
  end

  describe "custom method " do
    it "can generate a full_name" do
      expect(@user.full_name).to eq("SMITH, BOB")
    end
  end
end
