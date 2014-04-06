def wrong_guesses(round)
  wrong = round.cards_played.to_i - round.cards_correct.to_i
  wrong.to_s
end

def deck_name(round)
  Deck.find(round.deck_id).name
end

def get_real_round_number(round)
  round_number = 0
end

def get_round_date(round)
  Date.today if round.updated_at.nil?
end

def get_total_cards_played(all_rounds)
  all_rounds.inject(0) {|sum,x| sum + x.cards_played }
end

def get_total_cards_correct(all_rounds)
  all_rounds.inject(0) {|sum,x| sum + x.cards_correct }
end

def get_total_cards_wrong(all_rounds)
  get_total_cards_played(all_rounds) - get_total_cards_correct(all_rounds)
end

def local_rounds_collection(user_round)
  round_number = 1
  holder = []
  user_round.each do |round|
    holder << [ get_round_date(round), deck_name(round), round_number, round.cards_correct, wrong_guesses(round), round.cards_played]
    round_number += 1
  end
  holder#rounds_collection = [["1/10","Sneaks",1,10,5,15],["1/15","Sneaks",1,15,0,15]]
end
