require "../match"
require "../anti_social"
require "../tit_for_tat"
require "test/unit"
 
class TestMatch < Test::Unit::TestCase
 
  def test_game
    m = Match.new(AntiSocial.new, TitForTat.new, 10)
    assert_equal 10, m.plays.length
    assert_equal [35,35], m.scores
  end
  
  def test_anti_social_game
    m = Match.new(AntiSocial.new, AntiSocial.new)
    assert_equal 100, m.plays.length
    assert_equal [100,100], m.scores
  end
  
  def test_tit_for_tat_game
    m = Match.new(TitForTat.new, TitForTat.new)
    assert_equal 100, m.plays.length
    
    assert_equal [400,400], m.scores
  end
  
  def test_score_first_turn
    m = Match.new(TitForTat.new, TitForTat.new, 1)
    m.plays = [[:cooperate,:cooperate]]
    assert_equal [4,4], m.scores
    
    m.plays = [[:defect,:cooperate]]
    assert_equal [7,0], m.scores
    
    m.plays = [[:cooperate,:defect]]
    assert_equal [0,7], m.scores
    
    m.plays = [[:defect,:defect]]
    assert_equal [1,1], m.scores
  end
end
