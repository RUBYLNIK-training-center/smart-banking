class HomeController < ApplicationController
  def index
    @posts = Post.includes(:avatar_attachment).page(params[:page])
    @currencies = Currency.order(:name)
  end

  def about; end

  def support; end
end
