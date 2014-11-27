class MembersController < ApplicationController

  before_action :global_info

  def index
    @members = Member.showable_members.paginated(current_page)
  end

  def show
    @member = Member.find_by_id(params[:id])
  end

  def forum

  end

  def login
    
  end
end
