note
	description: "Summary description for {PROBLEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PROBLEM



feature{ANY}---

     this_solution:SOLUTION

feature{ANY}---

      get_solution:SOLUTION
            -- this function returns a solution
            require
            	 has_valid_solution
            deferred
            end

        -- boolean has_valid
        has_valid_solution:BOOLEAN
            -- returns true if the solution is valid
            require
            	   values_set_properly
             deferred
             ensure
             	  not Result or this_solution/=Void
             end


         values_set_properly:BOOLEAN


                require
                      current/=Void
                deferred
                end


end
