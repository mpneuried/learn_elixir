defmodule Todo.CacheTest do
	use ExUnit.Case
	
	alias Todo.Cache
	
	setup do
		list = %{ name: "home", items: [] }
		
		Cache.save( list )
		
		{ :ok, list: list }
	end
	
	test ".save add a list to the ets table" do
		info = :ets.info(Cache)
		assert info[:size] == 1
	end
	
	test ".find get e list out of the ets table", %{ list: list } do
		assert Cache.find( list.name ) == list 
	end
	
	test ".clear remove all element from teh cache", %{list: list } do
		Cache.clear
		refute Cache.find( list.name ) 
	end
	
	test ".lists get names of all lists", %{list: list } do
		assert list.name in Cache.lists
	end
end 
