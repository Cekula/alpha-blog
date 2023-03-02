class ArticlesController < ApplicationController
  def show
    #byebug for debuging,and debug console
    @article = Article.find(params[:id])
  end
end
