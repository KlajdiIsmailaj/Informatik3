note
	description: "Summary description for {SEARCH_PROBLEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SEARCH_PROBLEM[G->{NUMERIC,COMPARABLE}]


inherit
        DIVISIBLE_PROBLEM[INTEGER]
             redefine
             	this_solution
             end




create

	   invalid_create


feature{NONE}


      -- construct_invalid
       invalid_create

                              -- create an invalid solution object...

       do

       	      valid_solution:=FALSE
       	     -- create this_solution.construct_invalid
       	     create this_solution.invalid_create

       end

 feature{NONE}-- attributes-----------------------------------------
            this_solution:SEARCH_SOLUTION[G]
            T:detachable BINARY_TREE2[G]
            d_node:detachable NODE[G]
            exist:BOOLEAN
            number:detachable G
            	number2:INTEGER










feature{ANY}----getter-----------------------


             get_solution:SEARCH_SOLUTION[G]

             do
             	Result:= this_solution
             end
--feature{ANY}-----setter-----------------


            -- set_tree(Tree:detachable BINARY_TREE2[G], numb:INTEGER)


feature{ANY}
                   values_set_properly:BOOLEAN
                                             --tells if the value are well set
                        do
                           if	T/= Void and d_node/=Void then
                           	Result:=TRUE
                           else
                           	Result:=FALSE
                           	end
                        end




                    has_valid_solution:BOOLEAN

                           	      -- override the routine(has_valid_solution) from the class divisable problem
                                       --is_valid is in search_solution
                     do
                     	if this_solution /=Void and this_solution.is_valid then

                     		 valid_solution:=TRUE
                     		 else
                     		 valid_solution:=FALSE

                     	end
                     	     Result:=valid_solution
                     end


feature{NONE}
                     solve(number3:INTEGER)  ----here solve routine will be overwritten from the divisible_problem class inherited
               do
                          from

                          until
                          	  is_directly_solvable
                          loop
                          	    part(number3)
                          end
                                solve_directly

                           end



                         part(int:INTEGER)---------------------------------------------new------------------------



                      --   do
                               --  check attached d_node as your_node then

                               --  if your_node.get_right_child /=Void then
                                  --  d_node:=your_node.get_right_child

                                -- end
                                 --	end
                         -- end
                         ---------------------------------------------------------------------------
                           do
                           	  check attached d_node as your_node then


                           	       if your_node.get_value> int  and your_node.get_right_child/=Void then
                           	       	d_node:= your_node.get_right_child

                           	       	elseif your_node.get_value<int  and your_node.get_left_child/=Void then
                           	       		d_node:= your_node.get_left_child


                           	       end
                           	   end
                           end


---------------------------------------------------------------------------------------------------
              solve_directly(int2:INTEGER):BOOLEAN



                       require
                       	    is_directly_solvable
                       local

                       	value:G
               do

               	check attached d_node as e_node then
               	--	value:=e_node.get_value
               		 if e_node.get_value = int2 then

               	  		exist:= TRUE
               	 			 else
               	  		exist:=FALSE
               		end
               		Result:=exist
				end
               	       ensure
               	       has_valid_solution



               end



          
           is_solvable(inpu:INTEGER)

                  do


                   	check attached d_node as e_node then
                     if attached number as console_inpu then

                     	if e_node.get_value > inpu and e_node.get_right_child then

                     		 directly_solvable:=TRUE

                     		 elseif e_node.get_value < inpu  and e_node.get_left_child then

                     		  directly_solvable:=TRUE
                     		 else

                     		 	directly_solvable:=FALSE
                     	end

                     end

                       --referred

                   end



end
end
