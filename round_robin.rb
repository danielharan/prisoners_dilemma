require File.dirname(__FILE__) + '/match'

class RoundRobin
  
  # method is getting out of hand, especially with caching
  # TODO: break apart concerns, and maybe avoid caching similar results in different sort orders
  # this stands for now because it's ~20-30X faster for a round of 100 instances
  def initialize(strategies)
    cached_results = {}
    self.class.round_robin(strategies) do |strat1, strat2|
      if (cached_result = cached_results[[strat1.class,strat2.class]])
        strat1.score += cached_result[0]
        strat2.score += cached_result[1]
      else
        strat1_score_cache, strat2_score_cache = strat1.score, strat2.score
        m = Match.new(strat1, strat2)
        m.run
        
        cached_results[[strat1.class,strat2.class]] = [strat1.score, strat2.score]
        
        strat1.score += strat1_score_cache
        strat2.score += strat2_score_cache
      end
    end
  end

  def self.round_robin(elements)
    elements.each do |el1|
      (elements - [el1]).each do |el2|
        yield el1, el2
      end
      elements -= [el1]
    end
  end
end