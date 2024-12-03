{:ok, input} = File.read("input.txt")

input
  |> String.split("\n", trim: true)
  |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
  end)
  |> Enum.filter(fn line ->
    Enum.sort(line, :desc) == line or Enum.sort(line) == line
  end)
  |> Enum.filter(fn line ->
    line
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a,b] -> abs(a - b) end)
    |> Enum.map(fn e -> e in [1, 2, 3] end)
    |> Enum.all?()
    end)
  |> Enum.count()
  |> IO.inspect()
