class UsersController < ApplicationController
	before_action :check_user
	before_action :admin_permission, only: [:new, :create, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.role == 0 || @user.role.blank?
      engl_fio = User.generate_login(@user.lastname, @user.firstname, @user.patronymic)
      old = User.where("login LIKE ?", engl_fio + '%').last
      if old
        num = old.login.from(3).to(-1).to_i + 1
      else
        num = 1
      end
      @user.login = engl_fio + num.to_s
		end
		psw = SecureRandom.urlsafe_base64.first(10)
		@user.password = psw
		@user.password_confirmation = psw
		@user.email = @user.login + '@mami.ru'
		@user.group = Group.find(user_params[:group_id])
		file = File.new(Rails.root.join('tmp', "#{@user.login}-#{SecureRandom.hex(7)}.txt"), 'w')
		file.puts("LOGIN: #{@user.login} --- PASSWORD: #{psw}")
    file.close
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Пользователь создан.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Пользователь изменен.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь удален.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
	end

  def user_params
    fields = [:login, :password, :email, :lastname, :firstname, :patronymic, :group_id]
    if @current_user.administrator?
      fields << :is_active
      fields << :role
    end
    params.require(:user).permit(fields)
  end
end
