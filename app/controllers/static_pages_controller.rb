class StaticPagesController < ApplicationController

  skip_before_action :authenticate_user!, only:[:home,:help,:about,:contact]

  def home
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @likes = Like.where(micropost_id: params[:micropost_id])
    end
  end

  def help
  end

  def About
  end

  def contact
  end
end
