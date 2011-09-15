require "../round_robin"
require "test/unit"
 
class TestRoundRobin < Test::Unit::TestCase
  def test_2_2_match
    tft1 = TitForTat.new
    tft2 = TitForTat.new
    as1  = AntiSocial.new
    as2  = AntiSocial.new
    
    rr = RoundRobin.new([tft1,tft2,as1,as2])
    
    # expecting tft1 to have 400 against tft2, 350 points against the 2 anti-socials
    assert_equal 1100, tft1.score
    # 350 * 2 against TFTs, 100 against AS
    assert_equal 800, as1.score
  end
  
  def test_tft_against_defectors
    tft1, tft2 = TitForTat.new, TitForTat.new
    as1,  as2  = AntiSocial.new, AntiSocial.new
    def1, def2 = DefectingTitForTat.new(100,1), DefectingTitForTat.new(100,1)
    
    rr = RoundRobin.new([tft1,tft2,as1,as2,def1,def2])
    
    # expecting tft1 to have 400 against tft2, 350 points against the 2 anti-socials
    # and 396 * 2 against defectors
    assert_equal 400 + 350 * 2 + 396 * 2, tft1.score
    
    # 403 against TFT, 
    assert_equal 403 * 2 + 350 * 2 + 397, def1.score
  end
end