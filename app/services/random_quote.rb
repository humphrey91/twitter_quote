require 'json'

class RandomQuote

  def initialize
    @uri = URI.parse("https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en")
  end

  def perform
    response = Net::HTTP.get_response(@uri)
    sleep 5
    begin
      formatted = JSON.parse(response.body)
    rescue JSON::ParseError => e
      RandomQuote.new.perform
    end
    author = "anonymous"
    author = formatted["quoteAuthor"] unless formatted["quoteAuthor"].blank?
    quote = formatted["quoteText"]+ "-" + author
    if quote.length > 140
      RandomQuote.new.perform
    else
      return quote
    end
  end
end
