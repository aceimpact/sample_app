class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find_by!(id: params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
      redirect_to root_url
  end

  def update
    @comment.update_attributes(comment_params)
  end

  def destroy
    Comment.find!(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
