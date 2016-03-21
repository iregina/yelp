class HomeController < ApplicationController
  def index
  end

  def search
    parameters = { term: params[:term], limit: 15 }
    # p params[:term]
    @businesses = ($client.search('San Francisco', parameters).businesses)
   	render :result
  end

  def result
  end

end