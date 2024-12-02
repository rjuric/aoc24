{:ok, input} = File.read("input.txt")

input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
    |> Tuple.to_list()
    |> Enum.map(fn l -> Enum.sort(l) end)
    |> Enum.zip()
    |> Enum.map(fn {f,s} -> abs(s-f) end)
    |> Enum.sum
    |> IO.inspect()
