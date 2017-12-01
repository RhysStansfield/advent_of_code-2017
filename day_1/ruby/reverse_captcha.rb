# no-doc
class ReverseCaptchaBase
  def self.calculate(input)
    new(input).calculate
  end

  def initialize(input)
    self.chars = input.chars
  end

  def calculate
    values.inject(0, :+)
  end

  private

  def values
    chars.map.with_index do |char, i|
      int = char.to_i

      int == chars[next_index(i)].to_i ? int : 0
    end
  end

  def next_index(_)
    raise NotImplementedError
  end

  attr_accessor :chars
end

# no-doc
class ReverseCaptcha < ReverseCaptchaBase
  def initialize(input)
    self.chars = input.chars << input[0]
  end

  private

  def next_index(i)
    i + 1
  end
end

# no-doc
class ReverseCaptchaModulo < ReverseCaptchaBase
  def initialize(input)
    super
    self.limit = chars.length
    self.step_distance = chars.length / 2
  end

  private

  def next_index(i)
    (i + step_distance) % limit
  end

  attr_accessor :limit, :step_distance
end
