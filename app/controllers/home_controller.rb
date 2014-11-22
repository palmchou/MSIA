class HomeController < ApplicationController
  layout 'index', only: :index

  def index
    notice_news = News.notice_news.limit(3)
    msia_news = News.msia_news.limit(3)
    industry_news = News.industry_news.limit(3)
    @news = { notice_news: notice_news,
              msia_news: msia_news,
              industry_news: industry_news
    }
  end

  def contact

  end
end
