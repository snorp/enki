class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment
  include ActionController::UrlWriter
  include UrlHelper
  
  def after_create(comment)
    expire_cache_for(comment)
  end
  
  def after_update(comment)
    expire_cache_for(comment)
  end
  
  def after_destroy(comment)
    expire_cache_for(comment)
  end
  
  private
  
  def expire_cache_for(comment)
    FileUtils.rm_rf("#{RAILS_ROOT}/public/index.html")
    FileUtils.rm_rf("#{RAILS_ROOT}/public/#{post_path(comment.post)}.html")
    expire_page(posts_path)
  end
end