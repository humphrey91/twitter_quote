class RandomQuote
  def perform
    sleep 1
    uri = URI.parse("https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en")
    response = Net::HTTP.get_response(uri)
    formated = JSON.parse(response.body)
    quote = formated["quoteText"]+" -"+formated["quoteAuthor"]
    if quote.length > 140
      RandomQuote.new
    else
      return quote
    end
  end
end
