using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class MathsFunctions
    {
        float B;

        //calculates the max value from lamda expression array
        public void max(Func<float, float>[] l, float x)
        {
            float max = 0;
            for (int i = 0; i < l.Length; i++)
            {
                B = l[i](x);

                if (B > max)
                {
                    max = B;
                }
            }
            Console.WriteLine("the max is --> "+max);
        }

        //calculates the sum with 1 lamda expression from lo to hi
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
