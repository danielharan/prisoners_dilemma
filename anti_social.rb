require File.dirname(__FILE__) + '/strategy'

class AntiSocial < Strategy
  
  def play(opponents_plays)
    opponents_plays.last || :defect
  end
end