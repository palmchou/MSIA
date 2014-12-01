class TalentsController < ApplicationController

  before_action :global_info

  def index
    @talents = Talent.order(created_at: :desc).paginated(current_page)
  end

  def show
    @talent = Talent.find_by_id(params[:id])
  end

end
