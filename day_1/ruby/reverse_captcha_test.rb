require 'minitest/autorun'
require 'minitest/pride'
require File.join(File.expand_path(File.dirname(__FILE__)), 'reverse_captcha')

# no-doc
class ReverseCaptchaTest < MiniTest::Test
  def test_sums_1122_as_3
    assert_equal(3, calculate('1122'))
  end

  def test_sums_1111_as_4
    assert_equal(4, calculate('1111'))
  end

  def test_sums_1234_as_0
    assert_equal(0, calculate('1234'))
  end

  def test_sums_91212129_as_9
    assert_equal(9, calculate('91212129'))
  end

  private

  def calculate(num)
    ReverseCaptcha.calculate(num)
  end
end

# no-doc
class ReverseCaptchaModuloTest < MiniTest::Test
  def test_sums_1212_as_6
    assert_equal(6, calculate('1212'))
  end

  def test_sums_1221_as_0
    assert_equal(0, calculate('1221'))
  end

  def test_sums_123425_as_4
    assert_equal(4, calculate('123425'))
  end

  def test_sums_123123_as_12
    assert_equal(12, calculate('123123'))
  end

  def test_sums_12131415_as_4
    assert_equal(4, calculate('12131415'))
  end

  private

  def calculate(num)
    ReverseCaptchaModulo.calculate(num)
  end
end

# no-doc
class ReverseCaptchaHammer < MiniTest::Test
  INPUT = open(
    File.join(
      File.expand_path(__dir__),
      'input.txt'
    )
  ).read.strip

  def test_next_int_sums_to_1089
    assert_equal(1089, ReverseCaptcha.calculate(INPUT))
  end

  def test_modulo_int_sums_to_1156
    assert_equal(1156, ReverseCaptchaModulo.calculate(INPUT))
  end
end
