defmodule ListFilter do
  require Integer

  def call(list), do: filter(list)

  defp filter(list) do
    list
    |> Enum.filter(fn string ->
      case Integer.parse(string) do
        {_int, _} -> true
        :error -> false
      end
    end)
    |> Enum.map(fn string -> string |> String.to_integer() end)
    |> Enum.filter(fn number -> number |> Integer.is_odd() end)
    |> Enum.count()
  end
end
