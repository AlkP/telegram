class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  before_action :check_access, except: [:index]

  def index
    @users = User.all.sorting(cookies).page(params[:page])
  end

  def destroy
    @user.status =  if @user.active?
                      :archive
                    else
                      :active
                    end
    @user.save
    redirect_to users_path, notice: t('.change_status', name: @user.username, status: @user.status)
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: t('.notice')
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_access
    if @user.admin?
      redirect_to root_path, alert: t('users.wrong_request')
    end
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
