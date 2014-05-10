class MoneyCalculator
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}


	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
	ones = 
	end

	def moneyvalues(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
	ones = 1
	fives = 5
	tens = 10
	twenties = 20
	fifties = 50
	hundreds = 100
	five_hundreds = 500
	thousands = 1000
	end

	def change (chng, money)
	chng = money - params[:price]
	end
