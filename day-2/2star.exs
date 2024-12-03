{:ok, input} = File.read("input.txt")

input
  |> String.split("\n", trim: true)
  |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
  end)
  |> Enum.filter(fn line ->
    ((line == Enum.sort(line) or line == Enum.sort(line, :desc))
    and
    line
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a,b] -> abs(a - b) end)
    |> Enum.map(fn e -> e in [1, 2, 3] end)
    |> Enum.all?()
    )
    or
    Enum.any?(0..(length(line) - 1), fn idx ->
      removed_list = List.delete_at(line, idx)
      ((removed_list == Enum.sort(removed_list) or removed_list == Enum.sort(removed_list, :desc))
      and
      removed_list
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [a,b] -> abs(a - b) end)
      |> Enum.map(fn e -> e in [1, 2, 3] end)
      |> Enum.all?())
    end)
  end)
  |> Enum.count()
  |> IO.inspect()
