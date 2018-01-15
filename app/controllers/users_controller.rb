class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.sorting(cookies).page(params[:page])
  end

  def edit
  end
end
