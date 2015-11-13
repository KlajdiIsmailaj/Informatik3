class
	APPLICATION
create
	make
feature {NONE } -- initialization

       make


           do

           	  create my_node.make (70)
           	  if my_node/~void then
           	  	print(my_node)
           	  end

           end
feature -- Access

	 my_node:detachable NODE
end
