require "../anti_social"
require "test/unit"
 
class TestAntiSocial < Test::Unit::TestCase
 
  def test_play
    tft = AntiSocial.new
    assert_equal :cooperate, tft.play([:cooperate])
    assert_equal :defect,    tft.play([:defect])
    assert_equal :defect,    tft.play([])
  end
 
end
