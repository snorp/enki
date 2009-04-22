# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def author
    Struct.new(:name, :email).new(config[:author][:name], config[:author][:email])
  end

  def open_id_delegation_link_tags(server, delegate)
    links = <<-EOS
      <link rel="openid.server" href="#{server}" />
      <link rel="openid.delegate" href="#{delegate}" />
    EOS
  end
  
  def format_comment_error(error)
    {
      'body'   => 'Please comment',
      'author' => 'Please provide your name or OpenID identity URL',
      'base'   => error.last
    }[error.first]
  end

  def tweets_for_sidebar
    Tweet.find_recent
  end

  def linkify_tweet_message message
    message = h(message)
    message.gsub!(/(^|\s)@(\w+)/, '\1@<a href="http://www.twitter.com/\2">\2</a>')
    message.gsub!(/(^|\s)#(\w+)/, '\1#<a href="http://search.twitter.com/search?q=%23\2">\2</a>')
    auto_link(message)
  end
end
