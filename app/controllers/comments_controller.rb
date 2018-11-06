class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end


  def edit
    @comment = Comment.find_by!(id: params[:id])
  end

  def create
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.build(user_id: current_user.id,
                                         content: comment_params[:content])
    if @comment.save
      redirect_to root_url
    end
  end

  def update
    @comment.update_attributes(comment_params)
  end

  def destroy
    @comment = Comment.find!(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :micropost_id)
  end

end
