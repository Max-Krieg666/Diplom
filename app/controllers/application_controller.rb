class ApplicationController < ActionController::Base
  before_action :set_current_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protect_from_forgery with: :exception

  private
    def record_not_found
      render plain: "404 Not Found", status: 404
    end

    def set_current_user
      if session[:user_id].present?
        @current_user = User.find(session[:user_id])
      end
    end

    def require_login
      if @current_user
        flash[:danger] = I18n.t(:need_authorize)
        redirect_to login_path
      end
    end

    def check_user
      if @current_user.blank?
        flash[:danger] = I18n.t(:login_please)
        redirect_to root_path
      end
    end

    def manager_permission
      unless @current_user.try(:teacher?)
				flash[:danger] = I18n.t(:permission_denied)
        redirect_to login_path
      end
    end

    def admin_permission
      unless @current_user.try(:administrator?)
        flash[:danger] = I18n.t(:permission_denied)
        redirect_to login_path
      end
    end
end
