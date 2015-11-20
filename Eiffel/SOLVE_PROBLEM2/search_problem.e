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
     -- when creating this object it recieves the input form the console and the param will be used in the various routines below




       invalid_create(number:G)



                              -- create an invalid solution object...

       do

       	      valid_solution:=FALSE

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



	 set_tree(T:detachable BINARY_TREE2)
            local
            	 var_value:detachable G

            do
            	    -- T:= Tree.double
            	     T:=Tree
            	     check attached T as my_tree then
            	        T:=my_tree
            	        d_node:= my_tree.get_root
            	     	end


            	       -- this_solution.set(var_value
            	       if my_tree.get_root.get_value= current.number then


            	       if solve_directly(current.number) then

            	       	this_solution.is_exist


            	       end
            	        end
            	                                        --- this set routine is in search_SOLUTION CLASS

            	        if values_set_properly then
            	               solve(current.number)

            	        end
            	        ensure
            	        	values_set_properly or not has_valid_solution
            	         end



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
                     --solve(number3:INTEGER)
                     solve  ----here solve routine will be overwritten from the divisible_problem class inherited
               do
                          from

                          until
                          	  is_directly_solvable
                          loop
                          	    part
                          end
                                solve_directly

                           end



                         part---------------------------------------------new------------------------

                           do
                           	  check attached d_node as your_node then


                           	       if your_node.get_value> current.number and your_node.get_right_child/=Void then
                           	       	d_node:= your_node.get_right_child

                           	       	elseif your_node.get_value<current.number  and your_node.get_left_child/=Void then
                           	       		d_node:= your_node.get_left_child


                           	       end
                           	   end
                           end


---------------------------------------------------------------------------------------------------
              solve_directly:BOOLEAN



                       require
                       	    is_directly_solvable
                       local

                       	value:G
               do

               	check attached d_node as e_node then
               	--	value:=e_node.get_value
               		 if e_node.get_value = current.number then

               	  		exist:= TRUE
               	 			 else
               	  		exist:=FALSE
               		end
               		Result:=exist
				end
               	       ensure
               	       has_valid_solution



               end





           is_solvable
                   deferred
                  do


                   	check attached d_node as e_node then
                     if attached number as console_inpu then

                     	if e_node.get_value > current.number and e_node.get_right_child then

                     		 directly_solvable:=TRUE

                     		 elseif e_node.get_value <current.number  and e_node.get_left_child then

                     		  directly_solvable:=TRUE
                     		 else

                     		 	directly_solvable:=FALSE
                     	end

                     end



                   end



end
end
