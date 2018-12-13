class CommentsController < ApplicationController

  before_action :set_micropost, only: [:new,:edit,:create,:update,:destroy]
  before_action :set_comment, only: [:edit,:update,:destroy]

  def new
    @comment = @micropost.comments.build
  end


  def edit
  end

  def create
    @comment = @micropost.comments.build(user_id: current_user.id,
                                         content: comment_params[:content])
    if @comment.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
   @comment.destroy!
   redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :micropost_id)
  end

  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  def set_comment
    @comment = @micropost.comments.find(params[:id])
  end
end
