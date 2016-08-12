defmodule Todo.ServerTest do
	use ExUnit.Case
	
	alias Todo.Server
	
	setup do
		on_exit fn ->
			Enum.each Server.lists, fn( list )->
				Server.delete_list( list )
			end
		end 
	end
	
	test ".add_list add new supervised todo lists" do
		Server.add_list( "Home" )
		Server.add_list( "Work" )
		
		counts = Supervisor.count_children( Server ) 
		
		assert counts.active == 2
	end
	
	
	test ".find_list get a list by it's name" do
		Server.add_list( "Find it" )
		list = Server.find_list( "Find it" )
		
		assert is_pid( list )
	end
	
	test ".delete_list delete a list" do
		Server.add_list( "delete-it" )
		list = Server.find_list( "delete-it" )
		Server.delete_list( list )
		
		counts = Supervisor.count_children( Server ) 
		
		assert counts.active == 0
	end
end
