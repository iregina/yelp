
class HomeController < ApplicationController

  # returns all the business that fit criteria
  def generate_businesses
    address = params[:address]
    parameters = {category_filter: 'restaurants', radius_filter: params[:radius_filter], actionlinks: true}
    businesses = $client.search(address, parameters).businesses.select { |business|  business.rating > 3.5}
    return businesses
  end

  # generates a random restaurant for the user
  def biz
    p "%"*50
    p "RUNNING BIZ METHOD"
    businesses = generate_businesses
    p "The number of businesses is:"
    p businesses.length
    @business = random_business(businesses) 
   	render :summary
  end

  private

  # returns all possible restaurants
  def possible_restaurants(address, params)
    address = params[:address]
    parameters = {category_filter: 'restaurants', radius_filter: params[:radius_filter], actionlinks: true}
    @businesses = $client.search(address, parameters).businesses.select { |business|  business.eat24_url != nil }
    return @businesses
  end

  # returns a random number 
  def generate_random_number(businesses)
    max_number = businesses.length
    random_number = rand(max_number)
    return random_number
    
  end

  # returns a random business 
  def random_business(businesses)
  	lucky_number = generate_random_number(businesses)
  	return businesses[lucky_number]
  end

end