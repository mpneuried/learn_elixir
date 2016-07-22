months = ["Jan", "Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dez" ]

# Stream to cycle though the months of a year
IO.inspect months |> Stream.cycle() |> Enum.take( 24 )

# read the file
IO.puts File.stream!( "./sample.txt" )
	# filter by regexp for word starting with "d"
	|> Stream.filter( fn(ln)->ln =~ ~r/^d/i end )
	# capitalize the lines
	|> Stream.transform( [], fn(ln, acc)->{[String.capitalize(ln)], acc} end )
	# Convert to a list and runn the stream for all lines in sample.txt
	|> Enum.to_list
	# Sort the list by length
	|> Enum.sort( fn( a, b )->String.length( a ) < String.length(b) end )
