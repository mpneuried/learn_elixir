defmodule Todo.Server do
	use Supervisor
	
	alias Todo.Cache
	
	def add_list( name ) do
		Supervisor.start_child(__MODULE__, [name])  
	end
	
	def find_list( name ) do
		Enum.find lists, fn( child )->
			 Todo.List.name( child ) == name
		end
	end
	
	def delete_list( list ) do
		Supervisor.terminate_child(__MODULE__,list)
	end
	
	def lists do
		__MODULE__
			|> Supervisor.which_children
			|> Enum.map( fn({_, child, _, _}) -> child end )
	end
	
	# SUPERVIOSR API
	def start_link do
		srv = Supervisor.start_link(__MODULE__, [], name: __MODULE__)
		
		IO.inspect Cache.lists
			|> Enum.each( fn ( list_name )-> add_list( list_name ) end )
		
		srv
	end
	
	def init( _ ) do
		children = [
			worker( Todo.List, [], restart: :transient )
		]
		
		supervise( children, strategy: :simple_one_for_one )
	end
		
	
end
