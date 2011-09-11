class TitForTat
  
  def play(opponents_plays)
    opponents_plays.last || :cooperate
  end
end