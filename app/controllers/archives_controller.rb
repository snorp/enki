class ArchivesController < ApplicationController
  caches_page :index
  
  def index
    @posts = Post.archives(params).all
  end
end
