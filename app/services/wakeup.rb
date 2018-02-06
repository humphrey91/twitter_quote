require "net/http"
require "uri"

class Wakeup
  def perform
    uri = URI.parse("https://www.twitter-quotes.com/")
    sleep 3
    response = Net::HTTP.get_response(uri)
  end
end
