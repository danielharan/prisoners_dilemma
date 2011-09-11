require "../defecting_tit_for_tat"
require "test/unit"
 
class TestDefectingTitForTat < Test::Unit::TestCase
 
  def test_play
    tft = DefectingTitForTat.new
    assert_equal :cooperate, tft.play([:cooperate])
    assert_equal :cooperate, tft.play([:defect,:cooperate])
    assert_equal :cooperate, tft.play([:cooperate,:cooperate])
    assert_equal :defect,    tft.play([:defect])
    assert_equal :defect,    tft.play([:defect,:defect])
    assert_equal :cooperate, tft.play([])
  end
  
  def test_defection
    tft = DefectingTitForTat.new(3)
    assert_equal :cooperate, tft.play([:cooperate])
    assert_equal :defect,    tft.play([:defect,:cooperate])
    assert_equal :defect,    tft.play([:cooperate,:cooperate])
    assert_equal :defect,    tft.play([:defect])
    assert_equal :defect,    tft.play([:defect,:defect])
    assert_equal :cooperate, tft.play([])
    
    tft = DefectingTitForTat.new(100)
    assert_equal :defect,    tft.play([:cooperate] * 99)
    
  end
 
end
