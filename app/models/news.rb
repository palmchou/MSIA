class News < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  validates :cate, :title, :content, presence: true
  validates :cate, inclusion: { in: 1..3, message: '請選擇正確的資訊類型。' }
  validates :title, length: { maximum: 127 }

  NOTICE = 1
  MSIA = 2
  INDUSTRY = 3
  BRIEF_LENGTH = 55

  rails_admin do
    configure :news do
      label 'Owner of this ball: '
    end
  end

  def news

  end


  def self.news_per_page
    10
  end


  def self.notice_news
    self.where(cate: News::NOTICE).order(created_at: :desc)
  end

  def self.msia_news
    self.where(cate: News::MSIA).order(created_at: :desc)
  end

  def self.industry_news
    self.where(cate: News::INDUSTRY).order(created_at: :desc)
  end

  def self.paginated(page)
    self.paginate(page: page, per_page: News.news_per_page)
  end

  def cate_for_human
    case self.cate
      when NOTICE
        :msia_notify
      when MSIA
        :msia_news
      when INDUSTRY
        :industry_news
    end
  end

  def brief
    content = strip_tags(self.content)
    if content.length <= BRIEF_LENGTH
      self.content
    else
      content[0, BRIEF_LENGTH] + '...'
    end
  end


end