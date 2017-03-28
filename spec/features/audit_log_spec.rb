require 'rails_helper'

describe 'AuditLog Feature' do
  describe 'index' do
    before do
      @admin_user = FactoryGirl.create(:admin_user)
      @user =  FactoryGirl.create(:second_user)
      @audit_log = FactoryGirl.create(:audit_log)
      login_as(@admin_user, scope: :user)
    end
    it 'has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content(@audit_log.user.full_name)
    end

    it 'cannot be accessed by non admin users' do
      logout(@admin_user)
      login_as(@user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end
