note
	description : "SOLVE_PROBLEM application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
	--	do

	--	end
	--	client_input


	local
	      T2:BINARY_TREE2[INTEGER]
           lin_output:ARRAY[INTEGER]
           search:SEARCH_PROBLEM[INTEGER]

		end_of_input:BOOLEAN
       input:STRING
       val:INTEGER

     do
     	 create T2.constructTree
     	 create search.invalid_create
       T2.insert (34)
       T2.insert (4)
       T2.insert (343)
      -- T2.insert (304)
       T2.insert (1)
      -- T2.insert (20)
       lin_output:=T2.linear_representation
       print(lin_output)


       --search.set_tree (T2)
       print("%N")
       print(search.get_solution.get_value)

     	print("Please enter an integer afterwards press the enter-button !")

     		io.read_line

     	 print(io.last_string)

     	  input:=io.last_string
     	  if input/=Void then
     	  -- if the clients input is not null then the conversion ca proceed
     	  val:=input.to_integer
     	  if attached val as value then

     	     --T.search_node( value)-----------     	  	


     	end
     end
end
end
