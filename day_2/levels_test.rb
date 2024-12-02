require './levels.rb'
require 'minitest/autorun'

class TestLevel < Minitest::Test
  def test_check_spacing
    test1 = [1, 6, 7, 8]
    test2 = [1, 2, 3, 4]

    assert_equal false, check_spacing(test1)
    assert_equal true, check_spacing(test2)
  end

  def test_check_order
    test1 = [1, 2, 3, 4]
    test2 = [4, 3, 2, 1]
    test3 = [1, 3, 2, 4]
    test4 = [1, 1, 3, 4]

    assert_equal true, check_order(test1)
    assert_equal true, check_order(test2)
    assert_equal false, check_order(test3)
    assert_equal false, check_order(test4)
  end

end
