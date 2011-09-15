require File.dirname(__FILE__) + '/strategy'

class DefectingTitForTat < Strategy
  
  def initialize(turns=100,defect=1)
    @turns  = turns
    @defect = defect
  end

  def play(opponents_plays)
    if opponents_plays.length >= (@turns - @defect)
      :defect
    else
      opponents_plays.last || :cooperate
    end
  end
end