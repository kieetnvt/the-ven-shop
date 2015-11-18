require 'net/http'
require 'json'
require 'open-uri'


namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "admin",
                         email: "admin@mail.com",
                         password: "admin",
                         password_confirmation: "admin")
    admin.toggle!(:admin)
	end

end

#encoding: utf8
#hit : number of record
#offset : position begin get on cat_id

def get_cat_id
	appid = "dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI"
	@res = open("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/categorySearch?appid="+appid+"-&category_id=1").read
	return @res
end

def get(cat_id,hit,offset)
	appid = "dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI"
	@result = open("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid="+appid+"-&category_id="+cat_id.to_s+"&hits="+hit.to_s+"&offset="+offset.to_s+"&sort=-sold").read
	return @result
end

namespace :db do
  desc "Fill sample products"
  task getdata: :environment do
  	@cat_id_set = JSON.parse(get_cat_id)
    cate_id = @cat_id_set['ResultSet']['0']['Result']['Categories']['Children']
    (0..19).each do |sub_id|
    	category_name = cate_id[sub_id.to_s]['Title']['Medium']
    	(0..19).each do |offset|
			@parsed_data = JSON.parse(get(cate_id[sub_id.to_s]['Id'],50,offset*50))
			puts "---------------------------------------------------"
			@parsed_data['ResultSet']['0']['Result'].each do |index, prefix|
				if (index.to_i.to_s == index.to_s)
					name = prefix['Name'] if prefix['Name'].present?
					price = prefix['Price']['_value'] if prefix['Price']['_value'].present?
					img_small = prefix['Image']['Small'] if prefix['Image']['Small'].present?
					img_medium = prefix['Image']['Medium'] if prefix['Image']['Medium'].present?
					category_id = prefix['Category']['Current']['Id'] if prefix['Category']['Current']['Id'].present?
					
					rate = prefix['Review']['Rate'] if prefix['Review']['Rate'].present?
					count = prefix['Review']['Count'] if prefix['Review']['Count'].present?
					info = prefix['Description'] if prefix['Description'].present? 
					@new_product = Product.create!(name: name, price: price, img_small: img_small, img_medium: img_medium, cate_id: category_id, cate_name: category_name, rate: rate, count: count, info: info)
				end
			end
		end
	end
  end
end

namespace :db do
  desc "Fill sample products"
  task getcate: :environment do
  	@cat_id_set = JSON.parse(get_cat_id)
    cate_id = @cat_id_set['ResultSet']['0']['Result']['Categories']['Children']
    (0..19).each do |sub_id|
    	category_name = cate_id[sub_id.to_s]['Title']['Medium']
    	Cate.create!(cate_name: category_name)
    end
end
end