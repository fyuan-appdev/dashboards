class ExchangeController < ApplicationController

  def homepage
    require"open-uri"
    require"json"

    symbols = JSON.parse(open("https://api.exchangerate.host/symbols").read)
    symbols_hash = symbols.fetch("symbols")
    @array_of_symbols = symbols_hash.keys
    render({ :template => "exchange_view/forex_homepage.html.erb" })
  end

  def exchange
    require"open-uri"
    require"json"

    symbols = JSON.parse(open("https://api.exchangerate.host/symbols").read)
    symbols_hash = symbols.fetch("symbols")
    @array_of_symbols = symbols_hash.keys
    
    @base_currency = params.fetch("base_currency")
    render({ :template => "exchange_view/foreign_currency.html.erb" })
  end

  def rate
    require"open-uri"
    require"json"
    @base_currency = params.fetch("base_currency")
    @foreign_currency = params.fetch("foreign_currency")


  # export exchange rate from private_weather
  exchange_rate_url =  URI.open("https://api.exchangerate.host/convert?from=USD&to=EUR").read
  exchange_rate_hash = JSON.parse(exchange_rate_url)
  @exchange_rate = exchange_rate_hash.fetch("info").fetch("rate") 

    render({ :template => "exchange_view//exchange_rate.html.erb" })
  end

end
