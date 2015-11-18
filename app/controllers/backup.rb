require 'rubygems'
require 'json'
require 'net/http'
class ProductsController < ApplicationController
  def new
  end
  
  def show_category(category_id)
	   url = "http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid=dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI-&category_id="+category_id.to_s+"&sort=-sold"
	   
	   resp = Net::HTTP.get_response(URI.parse(url))
	   data = resp.body

	   # we convert the returned JSON data to native Ruby
	   # data structure - a hash
	   result = JSON.parse(data)

	   # if the hash has 'Error' as a key, we raise an error
	   if result.has_key? 'Error'
	      raise "web service error"
	   end
	   return result
	end

  def index
  	
    @news = show_category(635)
    
  	for i in 0..19 
	  	product = Product.new()
	  	product.namep = @news['ResultSet']['0']['Result'][i.to_s]['Name']
	  	product.info = @news['ResultSet']['0']['Result'][i.to_s]['Description']
	  	product.img_url = @news['ResultSet']['0']['Result'][i.to_s]['Image']['Small']
	  	product.price = @news['ResultSet']['0']['Result'][i.to_s]['Price']['_value'].to_s
	 	product.save
	 	puts info
 	end


  end

end
