class HomeController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def about; end
end
