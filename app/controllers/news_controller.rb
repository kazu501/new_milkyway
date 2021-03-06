class NewsController < ApplicationController
  before_action :set_new, only: [:show, :edit, :update, :destroy]

  def index
  	@news = New.all.order(id: "DESC")
  end

  def show
  end

  def new
  	@new = New.new
  end

  def create
  	@new = New.new(new_params)
    @new.user_id = current_user.id
  	if @new.save
  	  redirect_to news_path(@new)
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @new.update(new_params)
      redirect_to @new
    else
      render 'new'
    end
  end

  def destroy
    @new.destroy
    redirect_to news_index_path
  end

  def ensure_correct_user
    @new = New.find_by(id:params[:id])
    if @new.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

  private

    def new_params
      params.require(:new).permit(:head, :article)
    end

    def set_new
      @new = New.find(params[:id])
    end
end
