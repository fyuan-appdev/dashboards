Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", { :controller => "application", :action=>"homepage"})

  get("/forex", { :controller => "exchange", :action => "homepage"})

  get("/forex/:base_currency", { :controller => "exchange", :action => "exchange"})

  get("/forex/:base_currency/:foreign_currency", { :controller => "exchange", :action => "rate"})

#  get("/lottery/covid", { :controller => "lottery", :action => "lucky"})

end
