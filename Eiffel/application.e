class
	APPLICATION
	inherit
		ARGUMENTS
create
	make
feature {NONE } -- initialization

       make

       local
           T:BINARY_TREE2[INTEGER]
           line_output:ARRAY[INTEGER]
           input:STRING
           val:INTEGER

           do
           	   create T.constructTree
           	   T.insert(7)
           	   T.insert(9)
           	   T.insert(9)
           	   T.insert(15)
           	   T.insert(14)
           	   T.insert(10)
           	   T.insert(23)
           	   T.insert(23)
           	   T.insert(23)
           	   T.insert (60)
           	   T.insert(70)
           	  -- print("%N")
           	  -- T.delete(15)
           	   line_output:=T.linear_representation
           	  -- print(line_output)
           	  print("%N")
           	   print(T.is_duplicated (60))
           	    ---
           	     print("%N")
              -- T.is_duplicated (7)
     	print("Please enter an integer afterwards press the enter-button !")

               io.read_line
               val:=io.last_string.to_integer

          if attached val as vala then
          	print(vala)
          	 print("%N")
          	 print(io.last_string.to_integer)
          	 print("%N")
          	print(T.is_duplicated (vala))

 



          end



             --  end






end
end
