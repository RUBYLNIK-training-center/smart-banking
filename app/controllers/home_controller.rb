class HomeController < ApplicationController
  def index
  	@posts = Post.all.page params[:page]
  end
end
