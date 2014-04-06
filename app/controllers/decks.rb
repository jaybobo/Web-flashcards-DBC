get '/decks/:id' do
  if session[:value]
    @deck = Deck.find(params[:id])
    @new_round = true
    erb :"/decks/new_game"
  else
    redirect to ('/')
  end
end

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

  if @user_guess.nil?
    nil_answer
  elsif @user_guess == @deck.cards[@round.cards_played - 1].answer
    correct_answer
  else
    wrong_answer
  end
  erb :'/decks/show'
end




