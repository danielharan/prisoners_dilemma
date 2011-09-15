require "../match"
require "test/unit"
 
class TestMatch < Test::Unit::TestCase
 
  def test_game
    as  = AntiSocial.new
    tft = TitForTat.new
    m = Match.new(as, tft, 10)
    m.run
    assert_equal 10, m.plays.length
    assert_equal 35, as.score
    assert_equal 35, tft.score
  end
  
  def test_anti_social_game
    as1 = AntiSocial.new
    as2 = AntiSocial.new
    m = Match.new(as1, as2)
    m.run
    assert_equal 100, m.plays.length
    
    assert_equal 100, as1.score
    assert_equal 100, as2.score
  end
  
  def test_tit_for_tat_game
    tft1 = TitForTat.new
    tft2 = TitForTat.new
    m = Match.new(tft1, tft2)
    m.run
    assert_equal 100, m.plays.length
    
    assert_equal 400, tft1.score
    assert_equal 400, tft2.score
  end
  
  def test_score_first_turn
    tft1 = TitForTat.new
    tft2 = TitForTat.new
    m = Match.new(tft1, tft2, 1)
    m.plays = [[:cooperate,:cooperate]]
    m.run
    assert_equal 4, tft1.score
    assert_equal 4, tft2.score
    
    m.plays = [[:defect,:cooperate]]
    m.run
    assert_equal 7, tft1.score
    assert_equal 0, tft2.score
    
    m.plays = [[:cooperate,:defect]]
    m.run
    assert_equal 0, tft1.score
    assert_equal 7, tft2.score
    
    m.plays = [[:defect,:defect]]
    m.run
    assert_equal 1, tft1.score
    assert_equal 1, tft2.score
  end
end
