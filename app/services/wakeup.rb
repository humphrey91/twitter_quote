require "net/http"
require "uri"

class Wakeup
  def perform
    uri = URI.parse("https://twitter-quotes-v1.herokuapp.com/")
    sleep 3
    response = Net::HTTP.get_response(uri)
  end
end
