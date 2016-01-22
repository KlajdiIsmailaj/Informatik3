using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    //class for the math functions and calculate functions
    class MathsFunctions
    {
        float currentValue;

        //calculates the max value from lamda expression array
        //@param x a value for the func
        //@param maxValue the greatest calculated value
        //@param currentValue is the current calculated value to check for max 

        public void max(Func<float, float>[] l, float x)
        {
            float maxValue = 0;
            for (int i = 0; i < l.Length; i++)
            {
                currentValue = l[i](x);

                if (currentValue > maxValue)
                {
                    maxValue = currentValue;
                }
            }
            Console.WriteLine("the max is --> "+maxValue);
        }

        //calculates the sum with 1 lamda expression from lo to hi
        //@param lo lowest value
        //@param hi highest value
        //@param result the calculated sum from lo to hi
        public void sum(Func<int, int> l, int lo, int hi)
        {
            int result = 0;
            for (int i = lo; i < hi; i++)
            {
                Console.WriteLine("add this to result -->" + l(i));
                result += l(i);
            }
            Console.WriteLine("the sum is --> " + result);
        }


    }
}
