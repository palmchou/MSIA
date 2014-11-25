class LinksController < ApplicationController

  before_action :global_info

  def index
    @links = Link.all
  end
end