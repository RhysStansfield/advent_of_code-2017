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
      assert ReverseCaptcha.calculate("91212129") == 9
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

defmodule ReverseCaptchaModuloTest do
  use ExUnit.Case, async: true

  describe "ReverseCaptchaModulo.calculate/1" do
    test "sums 1212 as 6" do
      assert ReverseCaptchaModulo.calculate("1212") == 6
    end

    test "sums 1221 as 0" do
      assert ReverseCaptchaModulo.calculate("1221") == 0
    end

    test "sums 123425 as 4" do
      assert ReverseCaptchaModulo.calculate("123425") == 4
    end

    test "sums 123123 as 12" do
      assert ReverseCaptchaModulo.calculate("123123") == 12
    end

    test "sums 12131415 as 4" do
      assert ReverseCaptchaModulo.calculate("12131415") == 4
    end

    test "sums test input as 1089" do
      input = Path.expand(".")
              |> Path.join("input.txt")
              |> File.read!()
              |> String.trim()

      assert ReverseCaptchaModulo.calculate(input) == 1156
    end
  end
end
