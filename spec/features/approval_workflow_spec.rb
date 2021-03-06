require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    @user = FactoryGirl.create(:user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post, user: @user)
      visit edit_post_path(@post)
    end

    it 'has a status that can be edited on the form by an admin' do
      choose('post_status_approved')
      click_on 'Save'
      expect(@post.reload.status).to eq('approved')
    end

    it 'has a status that cannot be edited on the form by an non admin' do
      logout(@admin_user)
      login_as(@user, scope: :user)
      visit edit_post_path(@post)
      expect(page).to_not have_content('Approved')
    end

    it 'it should not be editable by post creator when post has been approved' do
      @post.update(status: 'approved')
      logout(@admin_user)
      login_as(@user, scope: :user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end
end
