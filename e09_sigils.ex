defmodule Xer do
	import Kernel, except: [ sigil_w: 2 ]

	def sigil_x( content, opts ) do
		IO.inspect opts
		for char <- content |> String.codepoints, into: "" do 
			cond do
				char == " " ->
					" "
				'u' == opts ->
					"X"
				true ->
					"x"
			end
		end

	end

	def sigil_w( content, _opts ) do
		content
			|> String.split
			|> Enum.map( fn( word )->
				word |> String.codepoints |> Enum.map_join( fn(_)->"x"end ) 
			end
			)
	end

	def runit do
		IO.inspect ~x(This is my secret string)
		IO.inspect ~x(This is my secret string)u

		IO.inspect ~w(This is my secret string)
	end
end

Xer.runit()