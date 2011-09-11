require "../tit_for_tat"
require "test/unit"
 
class TestTitForTat < Test::Unit::TestCase
 
  def test_play
    tft = TitForTat.new
    assert_equal :cooperate, tft.play([:cooperate])
    assert_equal :cooperate, tft.play([:defect,:cooperate])
    assert_equal :cooperate, tft.play([:cooperate,:cooperate])
    assert_equal :defect,    tft.play([:defect])
    assert_equal :defect,    tft.play([:defect,:defect])
    assert_equal :cooperate, tft.play([])
  end
 
end
