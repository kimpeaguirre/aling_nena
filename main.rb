require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

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

#CODES FOR BUYING

get '/purchase/:id' do
	@product = Item.find(params[:id])
	erb :purchase
end

post '/purchase/:id' do
	@product = Item.find(params[:id])

	#needtopay = @nabenta*@product.price.to_i
	#@money = MoneyCalculator.new(params[:ones].to_i, params[:fives].to_i, params[:tens].to_i, params[:twenties].to_i, params[:fifties].to_i, params[:hundreds].to_i, params[:five_hundreds].to_i, params[:thousands].to_i)
	@nabenta = params[:nabenta].to_i
	newquantity = @product.quantity - @nabenta
	newsold = @product.sold + @nabenta
	@product.update_attributes!(
      	quantity: newquantity,
      	sold: newsold,
      	)
	#@change = @money.change(needtopay)
	#@sukli = @money.changereal
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
