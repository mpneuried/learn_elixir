# Console.log

IO.inspect( xxx )

# VARIABLEN

# multiline strings
longtext = """
this
is
a
long
test
"""

# character list (used by erlang modules)
cl = 'hello world'

# string templates
me = "you and me"
s = "abc plus #{ me }"

# list
list = [4,5,6]
# append (slow)
listA = list ++ [7,8,9]
# append (fast)
listP = [ 1,2,3 | list ]

# String concat

c = "a" <> "b" # -> ab

# Zuweisungen (Match Operator)
a = 1

{ a, b, _, _named_ingore, c } = {1, "a", true, false, [ 1,2,3 ]}

# Anonymous functions

bar = fn( inp ) ->
	inp <> ".bar"
end

bar.( "foo" ) # foo.bar

# Pipeline

defmodule Test do
	def foo( inp ) do
		inp <> ".foo"
	end
	def bar( inp ) do
		inp <> ".bar"
	end
end

"Hello" |> Test.foo |>Test.bar # -> Hello.foo.bar
# similar to
Test.foo( Test.bar( "Hello" ) )

# Module

defmodule Modulname do
	def modulFunction(a,b) do
		a <> b
	end
end
Modulname.modulFunction("foo", "bar") # -> foobar

# Advanced Features of modules

defmodule Modulname do
	@moduledoc """
	**this** is the module description with `Markdown` support

	Docs can be acced via `h` within iex. e.g. `h Modulname` or `h Modulname.modulFunctionA`
	"""

	alias Other.Module.Path.XXX # internally used with. `XXX`
	alias Other.Module.Path.YYY, as: Y # internally used with. `Y

	import Other.Module.To.Import.All.Function # mixin the functions from other modules
	import Other.Module.To.Import.One.Function, only: [foo: 1 ] # mixin only the function foo is imported [functionname: arguments.length]
	import Other.Module.To.ImportWithout.Function, except: [bar: 1 ] # mixin all functiones exept the function bar [functionname: arguments.length]

	# internal values/state
	defstruct	fizz: nil
				buzz: nil

	@doc """
	Function descriptions

	## Example

			modulFunctionA( 2, 3 )
			1338
	"""
	def modulFunctionA(a,b) do
		a * devil( b )
	end

	defp devil(a) do # private devil function
		a + 666
	end

	# use a foreign module function as your own
	defdelegate function(a,b), to: Other.Module.Path.XXX, as: :my_own_functionname

	defmodule Modulname.SubmoduleNested do
		# ...
	end
end
# create instance 
%Modulname{ fizz: 23, buzz: "Hello" }

defmodule Modulname.SubmoduleExternal do
	# ...
end

# Documentation

@modulesdoc """
here you can document your module
"""

@doc """
here you can document your functions

You can use markdown inside the docs
"""

# Control Flow

if 1 + 1 == 2 do
	"WAT?"
else
	"OK!"
end

unless 1 + 1 == 2 do
	"OK!"
else
	"WAT?"
end

# switch is done with cond for mutliple values
# used to replace if ... elseif ... elseif ... end
cond do
	1 + 1 == 1 ->
		"This will never happen"
	2 * 2 != 4 ->
		"Nor this"
	true ->
		"This will"
end

# switch with pattern matiching
case Stripe.Customer.create(attrs) do
  {:ok, customer} ->
    "A customer was created with ID #{customer.id}"
  {:error, reason} ->
    "Customer could not be created because #{reason}"
  other ->
    "An unknown error occurred. #{other}"
end

# Pattern Matching

## Guards

def zero?(0) do
	true
end

def zero?(n) when is_number(n) do
	false
end

# Recursion / Loops
# elixir has no loops
# see e6.recusion.ex

# Capture Operator (function short)
Enum.map [1, 2, 3], fn(num) ->
  num * 2
end
# same as
Enum.map([1, 2, 3], &(&1 * 2))


# For loops
evens = fn( until ) ->
	 for idx <- 0..until, rem(idx, 2) == 0, do: idx
end
IO.inspect evens.(50)

# Sigils are shortcurls
# ~{key}{content-delim}{content}{content-delim}{options}
# key = lowercase allow vars in content
# key = uppercase no vars possibl
# regexp
~r/[a-Z0-9]/i
# list of words:
~w(hello there) == [ "hello", "there" ]
# escaped strings
~s( "hello" ) == "\"hello\""
# escaped character list
~c( hello 'cl' ) == 'hello \'cl\''

