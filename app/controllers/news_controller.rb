class NewsController < ApplicationController

  def index
    @news = News.order(created_at: :desc).paginated(current_page)
  end

  def notice
    @news = News.notice_news.paginated(current_page)
  end

  def msia
    @news = News.msia_news.paginated(current_page)
  end

  def industry
    @news = News.industry_news.paginated(current_page)
  end

  def show
    @news = News.find_by_id(params[:id])
  end

end
