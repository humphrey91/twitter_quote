class RandomQuote

  def initialize
    @uri = URI.parse("https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en")
  end

  def perform
    response = Net::HTTP.get_response(@uri)
    sleep 1
    formatted = JSON.parse(response.body)
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
