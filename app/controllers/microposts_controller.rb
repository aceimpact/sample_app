class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,   only: [:destroy]

  def show
    @micropost = Micropost.includes(:user).find(params[:id])
    @comments = @micropost.comments.includes(:user).all
    @comment  = @micropost.comments.build(user_id: current_user.id) if current_user
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home', locals: {comment: @comment}
    end
  end

  def destroy
    @micropost.destroy
    redirect_to request.referrer || root_url
  end

  private

   def micropost_params
     params.require(:micropost).permit(:content, :picture, :user_id)
   end

   def correct_user
      @micropost = current_user.microposts.find_by!(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
