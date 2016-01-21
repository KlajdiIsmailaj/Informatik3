using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    /*Generic List as our FilterableList class
    */
    public class FilterableList<T> : List<T>
    {
        /*
        The function add to add items in our List
        */
        public void add(T e)
        {
            this.Add(e);
        }

        /*
        The function remove to remove items from our List
        */
        public void remove(T e)
        {
            this.Remove(e);
        }

        /*
        The fuction has to check if there is a special item in the List
        */
        public bool has(T e)
        {
            return this.Contains(e);
        }

        /*
        Function filter 
        needed to filter each element and add it to a list if the expression is true
        returns the true expressionlist
        */
        public FilterableList<T> Filter(Func<T, bool> l)
        {
            FilterableList<T> trueExpressionList = new FilterableList<T>();
            foreach (T a in this)
            {
                if (l(a))
                {
                    trueExpressionList.add(a);
                }
            }
            return trueExpressionList;
        }
    }
}
