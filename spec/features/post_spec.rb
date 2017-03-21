require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of post' do
      expect(page).to have_content('Posts Index')
    end

    it 'has a list of posts' do
      post1 = FactoryGirl.create(:post, user: user)
      post2 = FactoryGirl.create(:second_post, user: user)
      # need to revisit the post index since we created post records
      visit posts_path
      expect(page).to have_content(/Thug lyfe/)
      expect(page).to have_content(/Derp/)
    end

    it 'has a list of posts from the logged in user' do
      post1 = FactoryGirl.create(:post, user: user)
      post2 = FactoryGirl.create(:second_post, user: user)
      other_user = FactoryGirl.create(:non_authorized_user)
      other_post = FactoryGirl.create(:second_post, user: other_user)
      visit posts_path
      expect(page).to_not have_content(/another users post/)
    end
  end

  describe 'navbar' do
    it 'can navigate to a new post form' do
      visit root_path
      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end

  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from a new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'Save'
    end

    xit 'will have a user associrated to it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'El Barto was here'
      click_on 'Save'
      expect(Post.last.user).to eq(user)
    end
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post, user: user)
      visit edit_post_path(@post)
    end

    it 'has an edit form that can be directly' do
      expect(page.status_code).to eq(200)
    end

    it 'has an edit form that can be reached from index' do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be updated with new params' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Updated rationale'
      click_on 'Save'
      visit posts_path
      expect(page).to have_content(/Updated rationale/)
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'delete' do

    it 'can be deleted' do
      post = FactoryGirl.create(:post, user: user)
      visit posts_path
      click_link("delete_post_#{post.id}_from_index")
      expect(page.status_code).to eq(200)
    end

  end
end
