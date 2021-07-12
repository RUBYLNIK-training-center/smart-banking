class CategoriesController < ApplicationController
  def index
    @categories = Category.all.includes(services: :wallet)
    @wallet = params[:wallet_reciepent]
  end
end
