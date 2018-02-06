require 'sidekiq'

class TweeterWorker
  include Sidekiq::Worker

  def perform
    users = User.all
    users = users.where(subscribed: true)
    users.each do |u|
      u.twitter
      u.post_to_twitter
    end
  end

end
