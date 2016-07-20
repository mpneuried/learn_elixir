defmodule MyList do
	def length( list ) do
		length( list, 0 )
	end

	defp length( [], count ) do
		count
	end

	defp length( [_|t], count ) do
		length(t, count + 1)
	end



	def each( [h|t], func ) do
		func.( h )
		each( t, func )
	end

	def each( [], _func ) do
		:ok
	end



	def map( list, func ) do
		do_map( list, func, [] )
	end

	defp do_map( [], _func, [] ) do
		[]
	end

	defp do_map( [], _func, res ) do
		:lists.reverse( res )
	end

	defp do_map( [h|t], func, res ) do
		fres = func.( h )
		res = [ fres | res ]
		do_map( t, func, res ) 
	end

	def sum( list ) do
		do_sum( list, 0 )
	end

	defp do_sum( [h|t], curr ) do
		curr = curr + h
		do_sum( t, curr )
	end

	defp do_sum( [], curr ) do
		curr
	end

	def reduce( list, func ) do
		do_reduce( list, func, 0 )
	end

	defp do_reduce( [], _func, curr ) do
		curr
	end

	defp do_reduce( [h|t], func, curr ) do
		curr = func.( h, curr )
		do_reduce( t, func, curr )
	end

end





list = [ {"A", 42, 1337 }, { "B", 133 , 666 } ]
listN = [ 1,2,3,4,5]

IO.inspect "LENGTH:"
IO.inspect MyList.length( list )

IO.inspect "EACH:"
IO.inspect MyList.each list, fn({name, _age, _size}) ->
	IO.inspect( name )
end

IO.inspect "MAP NAME:"
IO.inspect MyList.map list, fn({name, _age, _size}) ->
	name
end

IO.inspect "MAP SIZE:"
IO.inspect MyList.map list, fn({_name, _age, size}) ->
	size
end

IO.inspect "MAP AGE:"
IO.inspect MyList.map list, fn({_name, age, _size}) ->
	age
end

IO.inspect "MAP EMPTY:"
IO.inspect MyList.map [], fn({name, _age, _size}) ->
	name
end

IO.inspect "SUM:"
IO.inspect MyList.sum( listN )

IO.inspect "SUM EMPTY:"
IO.inspect MyList.sum( [] )

IO.inspect "REDUCE:"
IO.inspect MyList.reduce list, fn({_name, _age, size}, curr) ->
	curr + size
end

IO.inspect "REDUCE EMPTY:"
IO.inspect MyList.reduce [], fn({_name, _age, size}, curr) ->
	curr + size
end