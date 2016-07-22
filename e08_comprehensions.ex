evens = fn( until ) ->
	 for idx <- 0..until, rem(idx, 2) == 0, do: idx
end

joiner = fn( ls, sep ) ->
	for ch <- ls, into: "", do: ch <> sep
end

IO.inspect evens.(50)

IO.inspect joiner.( [ "a", "b", "c", "d" ], ":" )