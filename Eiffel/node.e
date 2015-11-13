note
	description: "Summary description for {NODE}."
	author: "Belmo.."
	date: "$13.11.2015$"
	revision: "$Revision$"

class NODE

create make



feature
	value:INTEGER
	right_child:detachable NODE
	left_child:detachable NODE
	parent:detachable NODE


feature{NONE}--Initialization
	make(a_value:INTEGER)
	--create a node without chlidren


	do
	   value :=a_value
	   set_right_child(void)
	   set_left_child(void)
	   set_parent(void)
	end

feature--Modification
           set_right_child(a_node:detachable NODE)
           --set the right child to a_node
     do
     	right_child:=a_node
     end

    set_left_child(a_node:detachable NODE)
            --set's left_left_child to a_node
            do
            	left_child:=a_node
            end
    set_parent(a_node:detachable NODE)
              --set's parent
              do
              	parent:=a_node
              end


end
