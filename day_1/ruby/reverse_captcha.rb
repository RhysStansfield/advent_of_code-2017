# no-doc
class ReverseCaptcha
  def self.calculate(input)
    new(input).calculate
  end

  def initialize(input)
    self.chars = input.chars << input[0]
  end

  def calculate
    values.inject(0, :+)
  end

  private

  def values
    chars.map.with_index do |char, i|
      int = char.to_i

      int == chars[i + 1].to_i ? int : 0
    end
  end

  attr_accessor :chars
end

# no-doc
class ReverseCaptchaModulo
  def self.calculate(input)
    new(input).calculate
  end

  def initialize(input)
    self.chars = input.chars
    self.limit = chars.length
    self.step_distance = chars.length / 2
  end

  def calculate
    values.inject(0, :+)
  end

  private

  def values
    chars.map.with_index do |char, i|
      int = char.to_i

      int == chars[(i + step_distance) % limit].to_i ? int : 0
    end
  end

  attr_accessor :chars, :limit, :step_distance
end
