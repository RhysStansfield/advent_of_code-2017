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

defmodule ReverseCaptchaModulo do
  def calculate(input) when is_binary(input) do
    String.codepoints(input)
    |> Enum.map(&String.to_integer/1)
    |> generate_map()
    |> calculate()
  end

  def calculate(%{ index_map: index_map, limit: limit, step_distance: step_distance }) do
    Enum.reduce(index_map, 0, fn({index, int}, accum) ->
      next_index = rem(index + step_distance, limit)
      next_int = Map.fetch!(index_map, next_index)

      accum + result(int, next_int)
    end)
  end

  defp generate_map(list) when is_list(list), do: generate_map(generate_index_map(list))
  defp generate_map(map) when is_map(map) do
    %{
      index_map: map,
      limit: Map.size(map),
      step_distance: div(Map.size(map), 2)
    }
  end

  defp generate_index_map(list) do
    [Enum.to_list(0..length(list) - 1), list]
    |> List.zip()
    |> Enum.into(%{})
  end

  defp result(value, _ = value), do: value
  defp result(_, _), do: 0
end
