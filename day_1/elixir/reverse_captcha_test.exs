ExUnit.start

Path.expand(".")
|> Path.join("reverse_captcha.exs")
|> Code.require_file()

defmodule ReverseCaptchaTest do
  use ExUnit.Case, async: true

  describe "ReverseCaptcha.calculate/1" do
    test "sums 1122 as 3" do
      assert ReverseCaptcha.calculate("1122") == 3
    end

    test "sums 1111 as 4" do
      assert ReverseCaptcha.calculate("1111") == 4
    end

    test "sums 1234 as 0" do
      assert ReverseCaptcha.calculate("1234") == 0
    end

    test "sums 91212129 as 9" do
      assert ReverseCaptcha.calculate("9") == 9
    end

    test "sums test input as 1089" do
      input = Path.expand(".")
              |> Path.join("input.txt")
              |> File.read!()
              |> String.trim()

      assert ReverseCaptcha.calculate(input) == 1089
    end
  end
end
