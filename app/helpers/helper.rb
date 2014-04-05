def correct_answer
  @guess = Guess.create(
    round_id: @round.id,
    card_id: @card.id,
    user_guess: @user_guess,
    correctness: true
    )
  @round.update_attributes(
    cards_played: @round.cards_played + 1,
    cards_correct: @round.cards_correct + 1
    )
end



def wrong_answer
  @guess = Guess.create(
    round_id: @round.id,
    card_id: @card.id,
    user_guess: @user_guess,
    correctness: false
    )
  @round.update_attributes(
    cards_played: @round.cards_played + 1
    )
end
