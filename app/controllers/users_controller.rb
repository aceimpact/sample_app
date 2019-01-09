class UsersController < ApplicationController

  before_action :ensure_correct_user, only:[:edit,:update,:show]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find_by!(id: params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @likes = Like.where(micropost_id: params[:micropost_id])
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
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name)
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
