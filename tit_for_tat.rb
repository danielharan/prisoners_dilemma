require File.dirname(__FILE__) + '/strategy'

class TitForTat < Strategy
  
  def play(opponents_plays)
    opponents_plays.last || :cooperate
  end
end