note
	description: "Summary description for {DIVISIBLE_PROBLEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DIVISIBLE_PROBLEM[G->{NUMERIC,COMPARABLE}]

inherit
	        PROBLEM


feature{NONE}
       directly_solvable:BOOLEAN
       valid_solution:BOOLEAN
       --input:INTEGER
feature{ANY}-- validity------


          has_valid_solution:BOOLEAN
               -- verifies if the solution ....

          deferred
          end

feature{NONE}



          is_directly_solvable:BOOLEAN
                   -- verifies if the problem is instanly solvable
                   local
                   	int5:INTEGER

                 do
                 
                 	is_solvable(int5)                 	   Result:=directly_solvable
                 ensure
                      not Result or has_valid_solution

                 end



           solve(int5:G)

                         -- here the problem is solvable so it get solved....
                    require

                    	  values_set_properly
                    deferred
                    ensure
                    	   has_valid_solution
                    end


          part(int4:G)

                    require
                    	  values_set_properly
                    	  not is_directly_solvable
                    deferred
                    end



              is_solvable(int3:INTEGER)
                                  --  check if the problem could be solved..

                    require
                    	  values_set_properly
                 do
                   -- deferred
                    end


            end



