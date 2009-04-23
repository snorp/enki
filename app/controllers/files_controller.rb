require 'find'
require 'shared-mime-info'

class FilesController < ApplicationController
  before_filter :setup_path

  def setup_path
    if ENV['RAILS_ENV'] == 'production'
      @real_path = "/var/www/files"
    else
      @real_path = "."
    end

    @path = '/'

    if params[:path]
      @real_path = File.expand_path("#{@real_path}/#{params[:path]}".gsub(/\/\.\./, ''))
      @path = params[:path].gsub(/\/\.\./, '')
    end
  end

  def index
    if File.directory? @real_path
      create_listing
    else
      send_file @real_path
    end
  end

  def listing
    create_listing
    render :partial => 'listing'
  end

  private

  def create_listing
    @listing = []

    d = Dir.open(@real_path)

    d.each do |item|
      next if item == '..' or item == '.'
        
      full_path = "#{@real_path}/#{item}"
      dict = {
        :path => item,
        :stat => File.stat(full_path),
        :mime => MIME.check(full_path).type
      }
      @listing.push(dict)
    end
    d.close

    @listing.sort! do |a,b|
      if a[:stat].directory? == b[:stat].directory?
        a[:path] <=> b[:path]
      elsif a[:stat].directory?
        -1
      else
        1
      end
    end
  end
end
