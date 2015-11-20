note
	description: "Summary description for {SEARCH_SOLUTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SEARCH_SOLUTION[G->{NUMERIC,COMPARABLE}]

inherit
	SOLUTION

create
		invalid_create

feature {SEARCH_PROBLEM, NONE}------ Initialization------

		invalid_create
				--- Initialization for this
				do
					set_valid
				end
feature {NONE} --- Attributes ---
	--	value: detachable G
		valid: BOOLEAN
		exist: BOOLEAN

feature {SEARCH_PROBLEM, NONE} ---- Setter ----

	--	set_valid
		set_valid:BOOLEAN
				---sets the valid true if item is set

				require
						current/= Void
				do
					if value /= Void then

						valid:= TRUE
					else
						valid:= FALSE

					end
					Result:=valid
				end

			--	set(new_value: detachable G)
		        set:BOOLEAN
					---sets item of solution---
					do
					--	value:= new_value

					--	set_valid

					if set_valid then
						exist:=TRUE
						else
						exist:=FALSE

						end

				      Result:=exist
					ensure
						not is_valid or value /=Void
					end

feature {ANY} --- getter---

	--	get_value: G
	 is_exist:BOOLEAN
				-- returns the item of solution---
			--	require
				--	is_valid
			--	do
				--	check attached value as f_value then
					--	Result := f_value
				--	end
				--ensure
				--	Result /= Void
			--	end
----------------------------------------------------
      do
      	if is_valid then

      		 exist:=TRUE
        else
        	exist:=FALSE
      	end
      	  Result:= exist
      end

----------------------------------------------------------

			is_valid: BOOLEAN
					-----return true if the item is set
				do
					set_valid
					Result:= valid
				ensure
					not Result or exist /= Void and exist= FALSE or exist=TRUE
				end



end
