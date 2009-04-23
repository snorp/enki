class Notifier < ActionMailer::Base
  helper :url
  
  def comment_notification comment
    recipients  Enki::Config.default[:author, :email]
    from        'enki@snorp.net'
    subject     'Blog Comment'
    body        :comment => comment
  end

end
