class SessionsController < ApplicationController

	def new
		if @current_user.present?
			redirect_to @current_user
		end
	end

	def create
		@user = User.where(login: params[:login]).first
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to @user, notice: I18n.t(:authorize_complete)
		else
			flash[:danger] = I18n.t(:invalid_username_or_password)
			render :new
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to login_path, notice: I18n.t(:exit_complete)
	end
end