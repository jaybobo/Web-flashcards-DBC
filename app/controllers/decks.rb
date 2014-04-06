get '/decks/:id' do
  #add auth
  @deck = Deck.find(params[:id])
  @new_round = true
  erb :"/decks/new_game"
end

# post '/decks/:id/new_game' do
#   @deck = Deck.find(params[:id])
#   @round = Round.create(user_id: session[:value], deck_id: @deck.id)
#   @card = @deck.cards[@round.cards_played]
#   # @round.update_attributes(cards_played: @round.cards_played + 1)
#   p "This is new_game, here is @card.question: #{@card.question}"
#   p "This is new_game, here is @round.cards_played: #{@round.cards_played}"
#   erb :"/decks/show"
# end

post '/decks/:id/next' do
  @deck = Deck.find(params[:id])
  @first_question = params[:first_question]
  if @first_question == "yes"
    @round = Round.create(user_id: session[:value], deck_id: @deck.id)
  else
    @round = Round.where(user_id: session[:value], deck_id: @deck.id).last
  end

  @round.update_attributes(cards_played: @round.cards_played)
  @user_guess = params[:user_guess]
  @card = @deck.cards[@round.cards_played]
  # p "This is next, here is @round.cards_played: #{@round.cards_played}"
  # p "This is next, here is @card.question #{@card.question}"
  # p "This is next, here is @deck.cards[@round.cards_played - 1].answer #{@deck.cards[@round.cards_played - 1].answer}"
  # p "This is next, here is @user_guess: #{@user_guess.inspect}"

  if @user_guess.nil?
    nil_answer
  elsif @user_guess == @deck.cards[@round.cards_played - 1].answer
    correct_answer
    if @card.id == @deck.cards.last.id
      erb :'/decks/gameover'
    end
  else
    wrong_answer
    if @card.id == @deck.cards.last.id
      erb :'/decks/gameover'
    end
  end
  erb :'/decks/show'
end




