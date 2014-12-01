class Talent < ActiveRecord::Base
  def self.paginated(page)
    self.paginate(page: page, per_page: 10)
  end
end
