class HomeController < ApplicationController
  def index
    @posts = Post.page(params[:page])
    @currencies = Currency.order(:name)
  end

  def about; end
end
