{:ok, input} = File.read("input.txt")

{first, second} =
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()

first
  |> Enum.map(fn e -> Enum.count(second, fn s -> s == e end) * e end)
  |> Enum.sum()
  |> IO.inspect()
