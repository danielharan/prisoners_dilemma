require File.dirname(__FILE__) + '/match'

class RoundRobin
  
  def initialize(strategies)
    strategies.each do |strat1|
      (strategies - [strat1]).each do |strat2|
        strat1_score_cache, strat2_score_cache = strat1.score, strat2.score
        m = Match.new(strat1, strat2)
        m.run
        strat1.score += strat1_score_cache
        strat2.score += strat2_score_cache
      end
      strategies -= [strat1] # true round-robin; otherwise it gets to play twice
    end
  end
  
end