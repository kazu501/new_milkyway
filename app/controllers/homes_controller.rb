class HomesController < ApplicationController

  def top
    @news = New.all.order(id: "DESC")
    @posts = Post.all.order(id: "DESC")
  end

  def help
  end

  def guid
  end

  def conv
  end

  def priv
  end

  def contact
  end
end
