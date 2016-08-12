defmodule Todo.ListTest do
	use ExUnit.Case
	
	alias Todo.List
	alias Todo.Item
	alias Todo.Cache
	
	setup do
		{:ok, list}  = List.start_link( "Home" )
		
		on_exit fn ->
			Cache.clear
		end
		{:ok, list: list}
	end
	
	test ".items returns the todos on the list", %{ list: list } do
		assert List.items( list ) == []
	end
	
	test ".add adds an item to the list", %{ list: list } do
		item = Item.new( "Create first" )
		List.add( list, item )
		assert List.items( list ) == [item]
	end
	
	test ".update can mak an item complete", %{ list: list } do
		item = Item.new( "2 complete" )
		List.add( list, item )
		
		item = %{ item | completed: true }
		List.update( list, item )
		
		assert List.items( list ) == [item]
		
	end
	
 end
