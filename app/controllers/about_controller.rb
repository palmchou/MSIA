class AboutController < ApplicationController
  def info
    @info = MsiaInfo.find_by_slug('info')
  end

  def structure
    @structure = MsiaInfo.find_by_slug('structure')
  end

  def purpose
    @purpose = MsiaInfo.find_by_slug('purpose')
  end
end
