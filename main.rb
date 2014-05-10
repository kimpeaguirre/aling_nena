require 'sinatra'
require './boot.rb'

#EASY PEASY CODES

get '/' do
	erb :home
end

get '/about' do
	erb :about
end

get '/products' do
	@products = Item.all
	erb :products
end

post '/products' do
	erb :products
	#products na updated
end


#CODES FOR BUYING

get '/purchase/:id' do
	@product = Item.find(params[:id])
	erb :purchase
end

post '/purchase/:id' do
	@product = Item.find(params[:id])
	@product.update_attributes!(
	sold: params[:sold]
	#quantity= quantity - sold
	)
	redirect to '/products'
end

# ROUTES FOR ADMIN SECTION
get '/admin' do
	@products = Item.all
	erb :admin_index
end

get '/new_product' do
	@product = Item.new
	erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
	@product = Item.find(params[:id])
	erb :product_form
end

post '/update_product/:id' do
	@product = Item.find(params[:id])
	@product.update_attributes!(
	name: params[:name],
	price: params[:price],
	quantity: params[:quantity],
	)
	redirect to '/admin'
end

get '/delete_product/:id' do
	@product = Item.find(params[:id])
	@product.destroy!
	redirect to '/admin'
end

