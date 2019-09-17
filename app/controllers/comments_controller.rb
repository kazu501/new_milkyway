class CommentsController < ApplicationController
  
  def create
  	@post = Post.find(params[:post_id])
  	@comments = @post.comments 
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      # flash.now[:alert] = '投稿できませんでした。内容を確認してください。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
