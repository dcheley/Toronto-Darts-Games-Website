class NewsController < ApplicationController
  def new
    @new = News.new
  end

  def create
    @new = News.new(news_params)
    if @new.save
      redirect_to "/news/index", notice: "Article added!"
    else
      render :new
    end
  end

  def edit
    @new = News.find(params[:id])
  end

  def update
    @new = News.find(params[:id])
    if @new.update_attributes(news_params)
      redirect_to "/news/index", notice: "Article updated!"
    else
      render :edit
    end
  end

  def destroy
    @new = News.find(params[:id])
    @new.destroy
    redirect_to "/news/index", notice: "Article deleted!"
  end

  def index
  end

  private
  def news_params
    params.require(:new).permit(:title, :content)
  end
end