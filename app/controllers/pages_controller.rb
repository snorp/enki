class PagesController < ApplicationController
  caches_page :show
  
  def show
    @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
  end
end
