class TweetSweeper < ActionController::Caching::Sweeper
  observe Tweet 
  include ActionController::UrlWriter
  include UrlHelper
  
  def after_create(tweet)
    expire_cache_for(tweet)
  end
  
  def after_update(tweet)
    expire_cache_for(tweet)
  end
  
  def after_destroy(tweet)
    expire_cache_for(tweet)
  end
  
  private
  
  def expire_cache_for(tweet)
    FileUtils.rm_rf("#{RAILS_ROOT}/public/cache")
  end
end
