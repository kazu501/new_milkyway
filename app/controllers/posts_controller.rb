class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  	@q = Post.ransack(params[:q])
    @posts = @q.result
    @posts = @q.result.page(params[:page]).per(10)
  end

  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create 
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
  	if @post.save
      flash[:notice] = '投稿が完了しました。'
  	  redirect_to @post
  	else
      flash.now[:alert] = '投稿できませんでした。内容を確認してください。'
  	  render :new
  	end
  end

  def edit 
  end

  def update
  	if @post.update(post_params)
      flash[:notice] = '投稿を編集しました。'
  	  redirect_to @post
  	else
      flash.now[:alert] = '編集できませんでした。内容を確認してください。'
  	  render 'edit'
  	end
  end

  def destroy
  	@post.destroy
    flash[:notice] = '投稿を削除しました。'
  	redirect_to root_path
  end

  private

    def set_post
  	  @post = Post.find(params[:id])
    end

    def post_params
  	  params.require(:post).permit(:title, :description, :image)
    end
end
