note
	description : "fakt application root class"
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
		do
			input_terminal
		end


	input_terminal

		local
			n:INTEGER
			fakultat:INTEGER
		do
			print ("Reading value from console (no termination)%N")

			io.read_integer
			n:=io.last_integer
			fakultat:=1

				if n>=0 then
					from
					until
						n<1
					loop
						fakultat:=fakultat*n
						n:=n-1
					end
					print("Fakultat ist: ")
					print(fakultat)
				else
					print("n muss 0 oder grosser sein")
				end



		end

end
