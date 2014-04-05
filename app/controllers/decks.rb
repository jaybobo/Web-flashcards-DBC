get '/decks/:id' do
  #add auth
  @deck = Deck.find(params[:id])
  @new_round = true
  erb :"/decks/show"
end

post '/decks/:id/new_game' do
  @deck = Deck.find(params[:id])
  @round = Round.create(user_id: session[:value], deck_id: @deck.id)
  @new_round = false
  @card_count = 0
  @correct = 0
  @card = @deck.cards[@card_count]
  erb :"/decks/show"
end

post '/decks/:id/next' do
  @deck = Deck.find(params[:id])
  @round = Round.where(user_id: session[:value], deck_id: @deck.id).last
  @user_guess = params[:user_guess]



  if @user_guess == @card.answer
    # @correct += 1
    @guess = Guess.create(
      round_id: @round.id,
      card_id: @card.id,
      user_guess: @user_guess,
      correctness: true
      )
    if @card.id == @deck.cards.last.id
      erb :'/decks/gameover'
    end
    erb :'/decks/show'
  else
    @guess = Guess.create(
      round_id: @round.id,
      card_id: @card.id,
      user_guess: @user_guess,
      correctness: false
      )
    if @card.id == @deck.cards.last.id
      erb :'/decks/gameover'
    end
    erb :'/decks/show'
  end
end




