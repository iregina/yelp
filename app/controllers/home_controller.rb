class HomeController < ApplicationController
  def index
  end

  def search
    parameters = { term: params[:term]}
    # p params[:term]
    @businesses = ($client.search('San Francisco', parameters).businesses)
   	render :result
  end

  def result
  end

# https://api.yelp.com/v2/search?cll=37.78804,-122.416079
# cli: '37.78804,-122.416079'

  def biz
  	address = params[:address]
    parameters = {category_filter: 'restaurants', radius_filter: 1000}
    @businesses = $client.search(address, parameters).businesses.select { |business| business.rating > 4 }
   	render :summary
  end

  def summary
  end

end