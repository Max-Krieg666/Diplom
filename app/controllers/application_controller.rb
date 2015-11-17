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
        flash[:danger] = 'Требуется авторизация'
        redirect_to login_path
      end
    end

    def check_user
      if @current_user.blank?
        flash[:danger] = 'Необходимо войти в систему для просмотра данной страницы!'
        redirect_to root_path
      end
    end

    def manager_permission
      unless @current_user.try(:teacher?)
        flash[:danger] = 'Недостаточно прав'
        redirect_to login_path
      end
    end

    def admin_permission
      unless @current_user.try(:administrator?)
        flash[:danger] = 'Недостаточно прав'
        redirect_to login_path
      end
    end
end
