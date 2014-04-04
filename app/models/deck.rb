class Deck < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :round
  has_many   :cards
end
