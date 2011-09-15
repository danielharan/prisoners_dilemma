require File.dirname(__FILE__) + '/anti_social'
require File.dirname(__FILE__) + '/defecting_tit_for_tat'
require File.dirname(__FILE__) + '/tit_for_tat'

class Match
  attr_accessor :plays
  
  def initialize(strategy1, strategy2, turns=100)
    @strategy1 = strategy1
    @strategy2 = strategy2
    s1plays, s2plays = [], []
    (1..turns).collect do |turn|
      s1plays << @strategy1.play(s2plays)
      s2plays << @strategy2.play(s1plays[0..-2])
    end
    @plays = s1plays.zip(s2plays)
  end
  
  def run
    @strategy1.score = 0
    @strategy2.score = 0
    @plays.each do |turn|
      case turn
      when [:cooperate, :cooperate]
        @strategy1.score += 4
        @strategy2.score += 4
      when [:cooperate, :defect]
        @strategy1.score += 0
        @strategy2.score += 7
      when [:defect, :cooperate]
        @strategy1.score += 7
        @strategy2.score += 0
      when [:defect, :defect]
        @strategy1.score += 1
        @strategy2.score += 1
      else
        raise "invalid argument"
      end
    end
  end
end