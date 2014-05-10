class MoneyCalculator
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}

attr_accessor :ones, :fives, :tens, :twenties, :fifties, :hundreds, :five_hundreds, :thousands, :paid, :change

	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
	@paid = ones*1 + fives*5 + tens*10 + twenties*20 + fifties*50 + hundreds*100 + five_hundreds*500 + thousands*1000
    	@thousands = 0
    	@five_hundreds = 0
    	@hundreds = 0
    	@fifties = 0
    	@twenties = 0
    	@tens = 0
    	@fives = 0
    	@ones = 0
	end

	def change(needtopay)
	changereal = @paid - needtopay
	change = changereal

	@change = {
   	:ones => @ones,
   	:fives => @fives,
   	:tens => @tens,
   	:twenties => @twenties,
   	:fifties => @fifties,
   	:hundreds => @hundreds,
   	:five_hundreds => @five_hundreds,
   	:thousands => @thousands,
   	}
	return @change
	end
end
