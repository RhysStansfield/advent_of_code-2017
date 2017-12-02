defmodule ReverseCaptcha do
  def calculate(input) do
    [String.codepoints(input), [String.first(input)]]
    |> Enum.concat()
    |> Enum.map(&String.to_integer/1)
    |> sum(0)
  end

  defp sum([head | tail = [_ = head | _]], accum), do: sum(tail, accum + head)
  defp sum([_ | tail], accum), do: sum(tail, accum)
  defp sum([], accum), do: accum
end
