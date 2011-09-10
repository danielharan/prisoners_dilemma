class TitForTat
  
  def play(opponents_last_play)
    opponents_last_play || :cooperate
  end
end