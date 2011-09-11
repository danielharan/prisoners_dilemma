class Match
  attr_accessor :plays
  
  def initialize(strategy1, strategy2, turns=100)
    s1plays, s2plays = [], []
    (1..turns).collect do |turn|
      s1plays << strategy1.play(s2plays)
      s2plays << strategy2.play(s1plays[0..-2])
    end
    @plays = s1plays.zip(s2plays)
  end
  
  def scores
    s1_score, s2_score = 0, 0
    @plays.each do |turn|
      case turn
      when [:cooperate, :cooperate]
        s1_score += 4
        s2_score += 4
      when [:cooperate, :defect]
        s1_score += 0
        s2_score += 7
      when [:defect, :cooperate]
        s1_score += 7
        s2_score += 0
      when [:defect, :defect]
        s1_score += 1
        s2_score += 1
      else
        raise "invalid argument"
      end
    end
    [s1_score,s2_score]
  end
end