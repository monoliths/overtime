class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all
    authorize @audit_logs
  end

  private
  def user_not_authorized
    flash[:alert] = "Not Authorized: Only Administrators are allowed."
    redirect_to root_path
  end
end
