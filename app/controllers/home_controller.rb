
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
    parameters = {category_filter: 'restaurants', radius_filter: params[:radius_filter]}

    @businesses = $client.search(address, parameters).businesses.select { |business| business.rating > 4 }
    @business = pick_random_business(@businesses) 
   	render :summary
  end

  def summary
  end

  private


  # This method picks a random business
  def random_number(businesses)
  	number_of_businesses = businesses.length
	random_number = rand(number_of_businesses)
	return random_number
  end

  def pick_random_business(businesses)
  	number = random_number(businesses)
  	return businesses[number]
  end

end