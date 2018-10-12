class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:update,:show,:index,:destroy]
  before_action :ensure_correct_user, only:[:edit,:update,:show]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find_by!(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find!(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to users_url
  end

private

def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
end

def ensure_correct_user
  if current_user.id != params[:id].to_i
    redirect_to(root_url)
  end
end

def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
