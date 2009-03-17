class ArchivesController < ApplicationController
  caches_page :index
  
  def index
    @months = Post.find_all_grouped_by_month
  end
end
