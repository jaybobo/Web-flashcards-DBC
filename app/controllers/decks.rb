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
  @card = @deck.cards[@round.cards_played]
  @round.update_attributes(cards_played: @round.cards_played + 1)
  erb :"/decks/show"
end

post '/decks/:id/next' do
  @deck = Deck.find(params[:id])
  @round = Round.where(user_id: session[:value], deck_id: @deck.id).last
  @user_guess = params[:user_guess]
  @card = @deck.cards[@round.cards_played - 1]
  # p @deck.cards[@round.cards_played -1 ].answer
  if @user_guess == @card.answer
    correct_answer
    if @card.id == @deck.cards.last.id
      erb :'/decks/gameover'
    end
    erb :'/decks/show'
  else
    wrong_answer
    if @card.id == @deck.cards.last.id
      erb :'/decks/gameover'
    end
    erb :'/decks/show'
  end
end




