class StaticPagesController < ApplicationController
before_action :authenticate_user!, except:[:home,:help,:about,:contact]

  def home
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def About
  end

  def contact
  end

end
