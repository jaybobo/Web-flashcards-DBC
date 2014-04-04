require 'csv'

FILE = 'statecapitals.csv'

options = { :headers => true, :header_converters => :symbol, :converters => :all }


deck = Deck.create(name: "State Capitals")

#seed_question = "What is the capital of " + state

	CSV.foreach(FILE, options) do |row|
		Card.new(question: row[:state], answer: row[:capital], deck_id: deck.id)
	end


