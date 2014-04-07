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
  round.updated_at.nil? ? Time.now.to_s(:short) : round.updated_at.to_s(:short)
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
    holder << Hash[date: get_round_date(round),game: deck_name(round),round: round_number,correct: round.cards_correct,wrong: wrong_guesses(round),total: round.cards_played]
    round_number += 1
  end
  holder
end

def global_player_correct_chart
  CSV.generate do |csv|
    csv << ["Field1","Field2"]
      User.all.each do |user|
        num_of_total_correct = global_chart_helper_sums_correct(user.id)
          csv << [user.user_name,num_of_total_correct]
      end
  end
end

def global_chart_helper_sums_correct(id)
  rounds = Round.where(user_id: id)
  get_total_cards_correct(rounds)
end


def last_five_player_rounds(collection)
  CSV.generate do |csv|
    csv << ["Field1","Field2"]
    collection.pop(5).each do |round|
      csv << [round[:date],round[:correct]]
    end
  end
end
