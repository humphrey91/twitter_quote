require "net/http"
require "uri"

class Wakeup
  def perform
    sleep 1
    uri = URI.parse("https://twitter-quotes-v1.herokuapp.com/")
    response = Net::HTTP.get_response(uri)
  end
end
