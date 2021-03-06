note
	description: "Summary description for {NODE}."
	author: "Belmo.."
	date: "$13.11.2015$"
	revision: "$Revision$"



class NODE[G->{COMPARABLE}]

create make
feature--initialization
     	make(a_value:G)
	--create a node without chlidren
do
	    value:=a_value
end

feature---attributes1-----

    value:G
	right_child:detachable NODE[G]
	left_child:detachable NODE[G]
	parent:detachable NODE[G]



feature{ANY}--getter--------

 get_value:G

       require
       	      current/=Void
       	do
       		Result:=value
       	end
       	      -- this function(routine) RETURNS value ..


    get_right_child:detachable NODE[G]



       require
       	      current/=Void
       	do
       		Result:=right_child
       	end
       	      -- this function(routine) RETURNS the right child ..

       	      get_left_child:detachable NODE[G]


       require
       	      current/=Void
       	do
       		Result:=left_child
       	end
       	      -- this function(routine) RETURNS the left child ..

       	      get_parent:detachable NODE[G]

       require
       	      current/=Void
       	do
       		Result:=parent
       	end
       	      -- this function(routine) RETURNS the parent node ..
----------- print inoder or represent the nodes in a linear way-----
feature-----Access----

 -- value:INTEGER

  has_right_child:BOOLEAN

  do
  	Result:=right_child/=Void
  end
-----
  has_left_child:BOOLEAN

  do
  	Result:=left_child/=Void
  end



feature{BINARY_TREE2,NODE,APPLICATION} --------setters---APPLICATION HAS TO BE REMOVED --------------------------------------------
   set_value(a_value:G)

   do
   	value:=a_value
   	ensure
   		value=a_value
   		end

   set_right_child(thisNode:detachable NODE[G])

     do
     	right_child:=thisNode
     	ensure
        right_child=thisNode
     end




   set_left_child(thisNode:detachable NODE[G])

     do
     	left_child:=thisNode
     	ensure
        left_child=thisNode
     end

set_parent(thisNode:detachable NODE[G])

     do
     	parent:=thisNode
     	ensure
        parent=thisNode
     end


set_childNode(thisNode:NODE[G])


  require
  	(get_right_child=Void)or(get_left_child=Void)
  	do
  		thisNode.set_parent (current)
  		if thisNode.get_value>= value then
  			set_right_child(thisNode)
  			else
  					set_left_child(thisNode)
  			end
  			    ensure
  				thisNode.get_parent/=Void
  				end

  	end

