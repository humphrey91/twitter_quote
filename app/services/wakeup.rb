require "net/http"
require "uri"

class Wakeup
  def perform
    sleep 1
    uri = URI.parse("https://https://twitter-quotes-v1.herokuapp.com/")
  end
end
