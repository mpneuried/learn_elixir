defmodule User do
	@moduledoc """
	A simple user

	    %User{ name: "Horst Peter", email: "host.peter@example.com" }
	"""
	import String, only: [split: 1 ]
	import List, only: [first: 1,last: 1 ]

	defstruct name: nil, email: nil

	@doc """
	get the firstname
	
	## Parameters

	- `user` - A User struct

	## Example

		user = %User{ name: "Horst Peter" }
	    User.first_name( user )
	    "Horst"
	"""
	def first_name( user ) do
		user |> getNames |> first
	end

	@doc """
	get the lastname

	## Parameters

	- `user` - A User struct

	## Example
	
		user = %User{ name: "Horst Peter" }
	    User.last_name( user )
	    "Peter"
	"""
	def last_name( user ) do
		user |> getNames |> last
	end

	defp getNames( user ) do
		split( user.name )
	end
end