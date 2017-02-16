require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "bob", last_name: "smith")
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of post' do
      expect(page).to have_content("Posts Index")
    end

    it 'has a list of posts' do
      @post1 = @user.posts.create(date: Date.today, rationale: 'post 1')
      @post2 = @user.posts.create(date: Date.today, rationale: 'post 2')
      @post3 = @user.posts.create(date: Date.today, rationale: 'post 3')
      # need to revisit the post index since we created post records
      visit posts_path
      expect(page).to have_content(/post 1|post 2|post3/)
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

    it 'will have a user associated to it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'El Barto was here'
      click_on 'Save'
      expect(Post.last.user).to eq(@user)
    end
  end
end
