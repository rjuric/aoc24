{:ok, input} = File.read("input.txt")

Regex.scan(~r/(do\(\))|(don't\(\))|mul\([0-9]{1,3},[0-9]{1,3}\)/, input)
|> Enum.flat_map(fn l -> Enum.uniq(l) end)
|> Enum.filter(fn l -> l != "" end)
|> Enum.reduce({[], true}, fn
  "do()", {acc, _} -> {acc, true}
  "don't()", {acc, _} -> {acc, false}
  command, {acc, true} -> {[command | acc], true}
  _, state -> state
end)
|> elem(0)
|> Enum.map(fn op -> List.to_tuple(Enum.flat_map(Regex.scan(~r/[0-9]+/, op), fn l -> l end)) end)
|> Enum.reduce(0, fn {a, b}, x -> String.to_integer(a)*String.to_integer(b)+x end)
|> IO.inspect()
