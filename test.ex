defmodule Test do
	def foo( inp ) do
		inp <> ".foo"
	end
	def bar( inp ) do
		inp <> ".bar"
	end
end

xxx = "Hello" |> Test.foo |>Test.bar
yyy = Test.foo( Test.bar( "Heyyo" ) )
IO.inspect( xxx )
IO.inspect( yyy )