note
	description: "Summary description for {BINARY_TREE2}."
	author: "belmo"
	date: "$Date$"
	revision: "$Revision$"

class
   	BINARY_TREE3[G->{COMPARABLE,NUMERIC}]



	create constructTree --constructor call..

feature
--{NONE}--attributes---
  root:detachable NODE[G]

   var:detachable G

   tree_size :INTEGER
   is_tree_empty:BOOLEAN


feature{NONE}--initialization of the tree--


  constructTree

 do
	 is_tree_empty :=TRUE
	 tree_size:=0

end
feature{ANY}--getter for tree's elements---

is_this_empty:BOOLEAN
      do
   	    Result:=is_tree_empty
      end

       get_root:NODE[G]-- get root method

         require
         	 tree_is_not_empty:not is_this_empty
       do
         	Result :=attached_node(root)
         ensure
            attached_result:Result/=Void
            root_result: Result.get_parent=Void
    end


    get_lowest:NODE[G]
         -- search and returns the value of the node with the smallest value in the tree...
         require
         -- for this search we need elements in the Tree , in other words the Tree must neo be empty
               Tree_not_empty:not is_tree_empty
               local
               	 var_node:attached NODE[G]
              do
              	    Result:= attached_node(root)
              	 ensure
              	 	result_is_attached:Result/=Void  -- make sure the tree is not empty
              	 	result_is_root:Result.get_parent=Void -- make sure the node considered root has not parent..
             end
     get_upper:NODE[G]
             -- like the previous fonction(routine) it returns the value of the node with the highest value
             require
             	Tree_not_empty:not is_tree_empty
             	local
                  var_node:attached NODE[G]
               do
               	from
               		 var_node:=get_root
               	until
               		var_node.get_right_child=Void
               	loop
               		 var_node:=attached_node(var_node.get_right_child)
               	end
               	     Result:=var_node
               	  ensure
               	  	result_is_attached:Result/=Void
               	  	result_is_highest:Result.get_right_child=Void -- make sure the considered value is the biggest

               end


   get_next_upper_node(b_node:NODE[G]):detachable NODE[G]
                --  this routine finds and returns the next bigger node of the tree if none return void
                local
                	var_node:detachable NODE[G]
                	do
                		 if b_node.get_right_child = Void then
                		 from
                		 	var_node:= attached_node(b_node.get_parent)
                		 until
                		 	 var_node=Void or var_node.get_value> b_node.get_value
                		 loop
                		 	      var_node:=attached_node(var_node.get_parent)
                		 end

                		 else
                		 	  from
                		 	  	var_node:=attached_node(b_node.get_right_child)
                		 	  until
                		 	  	     var_node.get_left_child=Void
                		 	  loop
                		 	  	   var_node:= attached_node(var_node.get_left_child)
                		 	  end

                		 end
                		 Result:= var_node
                	end
















feature--check void safety of nodes and values----------------
     attached_node(a_node:detachable NODE[G]):attached NODE[G]

      do
      	  check attached a_node as valid_node then
      	  	Result:=valid_node
      	  	end
      	   end

     attached_value(this_value:detachable G):attached G

     do
     	check attached this_value as valid_value then
     		Result:=valid_value

     	 end
     end
     get_tree_size :INTEGER
     do
     	Result :=tree_size

     end



----------------------insert routine -------------------------------------------------

feature{ANY}

      insert(a_value:G)


          local
          	      new_node:NODE[G]
          	      temp_var:NODE[G]


          do
          	create new_node.make (a_value)
          	if is_this_empty then
          		root:=new_node
          	--	var:= a_value.var
          		tree_size:=1
          		is_tree_empty:=false
            else
            	from
            		temp_var:=attached_node(root)

            	until
            	     (temp_var.get_value>a_value and temp_var.get_left_child=Void)or
            	      (temp_var.get_value<=a_value and temp_var.get_right_child=Void)

            	loop
            		if temp_var.get_value> a_value then
            			temp_var:=attached_node(temp_var.get_left_child)
            			else
            				temp_var:=attached_node(temp_var.get_right_child)

            			end
            		end
            		if not is_duplicated(a_value) then  -- checks if a node with this value exist already
            		                                    -- it which case it deos at again but ends
            				temp_var.set_childNode(new_node)
            		tree_size:=tree_size+1


                end
            	end

          		  ensure
          		  	  inserted_value:is_duplicated(a_value)

          	end
          	--**************** remove-routines-  the routine delete checks if the value exist in tree and parses as arg to delete_recursiv,who deos effectively remove the node ------------
          	 delete(value:G)
          	   local
          	   	 var_node :NODE[G]
          	  do
          	  	if not is_this_empty then
          	  		from
          	  			var_node:=get_root
          	  		until
          	  		     not  is_duplicated(value)


          	  		loop
          	  			 if var_node.get_value=value then
          	  			 delete_recursiv(var_node)
          	  			 var_node :=get_root
          	  			 elseif var_node.get_value>value then
          	  			 	var_node:=attached_node(var_node.get_left_child)
          	  			  else
          	  			     var_node:=attached_node(var_node.get_right_child)

          	  			 end
          	  		end

          	  	end
          	  	 ensure
          	  	          value_deleted: not is_duplicated(value)
          	  end

feature{NONE}
        delete_recursiv(c_node:NODE[G])

        --- delete the chosen node from the tree..
             local
             	var_node:NODE[G]
             	var_parent:NODE[G]
             	var_value:G

            do
            	if c_node.get_left_child=Void and c_node.get_right_child=Void then
            	     if c_node.get_parent=Void  then
            	     	root:=Void
            	     	tree_size:=0
            	       is_tree_empty:=TRUE
                      else
                 	    var_parent:=attached_node(c_node.get_parent)
                 	    if var_parent.get_value>c_node.get_value then  ------- if node has parent the parent should be set to null(void)
                 	    	 var_parent.set_left_child (void)


                 	     else
                 	     	 var_parent.set_left_child (Void) -------------------------------------------------------------

                 	    end
                 	        tree_size:=tree_size-1

            	     end
            	 elseif c_node.get_left_child=Void then
            	         var_node:=attached_node(c_node.get_right_child)
            	         if c_node.get_parent=Void then
            	             root:=var_node
            	             var_node.set_parent (Void)
            	          else
            	          	    var_parent:=attached_node(c_node.get_parent)
            	          	    var_parent.set_childnode(var_node)


            	         end
            	          tree_size:= tree_size-1
            	 elseif c_node.get_right_child=Void  then
            	          var_node:=attached_node(c_node.get_left_child)

            	 	     if c_node.get_parent=Void then
            	 	       root:=var_node
            	 	       var_node.set_parent (Void)
            	 	      else
            	 	      	var_parent:=attached_node(c_node.get_parent)
            	 	      	var_parent.set_childnode (var_node)
            	 	      end
            	 	    	tree_size:=tree_size-1

            	 else
            	 	     	from
            	 	     		var_node:=attached_node(c_node.get_right_child)
            	 	     	until
            	 	     		var_node.get_left_child=Void
            	 	     	loop
            	 	     		var_node:=attached_node(var_node.get_left_child)
            	 	     	end
            	 	     	var_value:=var_node.get_value
            	 	     	c_node.set_value(var_value)
            	 	     	delete_recursiv(var_node)

            	end
            end

         -- end ------ end needs to be verified*************
--------give the tree elements in inorder-------------
feature---linear representation-----
linear_representation:ARRAY[G]
        local
        	var_array : ARRAY[G]
        	var_node: NODE[G]
        	i:INTEGER
   do
   	     create var_array.make(0,get_tree_size-1)
   	         from

   	         	var_node:=get_lowest -- to be created
   	         	i:=0
   	         	var_array[i]:=var_node.get_value
   	         until
   	         	  var_node=get_upper
   	         loop
   	         	   var_node := attached_node(get_next_upper_node(var_node))
   	         	   i:=i+1
   	         	   var_array[i]:=var_node.get_value

   	          end
   	          Result:=var_array
   end


--feature{ANY}--- functions-------------

         is_duplicated(value:G):BOOLEAN


         local
         	     temp_var:detachable NODE[G]

         	     taken_value:BOOLEAN
         do
         	taken_value:=FALSE
         	if not is_this_empty then
         		from
         			 temp_var:=get_root
         		until
         			taken_value or(temp_var=Void)

         		loop
         			if temp_var.get_value=value then
         				taken_value:=true
         				elseif temp_var.get_value>value then
         					temp_var:= temp_var.get_left_child

         				else
         						temp_var:= temp_var.get_right_child
         			end
         		end

         	end
         	Result:=taken_value
         end

end


