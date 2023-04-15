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
end
