require 'csv'


FILE = 'statecapitals.csv'


class Card
	def initialize(args)
		@question = args[:question]
		@answer = args[:answer]
	end
end


options = { :headers => true, :header_converters => :symbol, :converters => :all }

#seed_question = "What is the capital of " + state

	CSV.foreach(FILE, options) do |row|
		Card.new(question: row[:state], answer: row[:capital])
	end


#:header_converters => :downcase,

# def parser(filename, options)
# parser(FILE, options)



#:headers => true, :header_converter => :symbols
#seed_question = "What is the capital of " + state
#seed_answer = capital


#deck = Deck.new
#Card.new(deck_id: deck, question: seed_question, answer: seed_answer)





