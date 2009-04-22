require 'rss/1.0'
require 'rss/2.0'
require 'net/http'

class Tweet < ActiveRecord::Base

  DEFAULT_LIMIT = 5
  TWEETS_URL = "http://twitter.com/statuses/user_timeline/14663842.rss"

  def self.refresh
    data = Net::HTTP.get URI.parse(TWEETS_URL)
    rss = RSS::Parser.parse(data, false)
    rss.items.each do |item|
      next if Tweet.find_by_link(item.link)

      Tweet.create :message => item.description.gsub(/^snorp: /, ''), :link => item.link, :tweeted_at => Time.parse(item.date.to_s)
    end
  end

  def self.find_recent limit=DEFAULT_LIMIT
    Tweet.find(:all, :order => 'tweets.tweeted_at DESC', :limit => limit)
  end

end
