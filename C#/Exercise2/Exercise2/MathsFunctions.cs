using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class MathsFunctions
    {
        int A;
        float B;

        public void max(Func<float, float>[] l, float x)
        //  public void max(Func<int, int>[] l, int x)
        {
            for (int i = 0; i < l.Length; i++)
            {
                float max = 0;

                B = l[i](x);
                if (B > max)
                {
                    max = B;
                }
            }
            Console.WriteLine(B);
        }
        public void sum(Func<int, int> l, int lo, int hi)
        {
            int result = 0;
            for (int i = lo; i < hi; i++)
            {
                Console.WriteLine("add this to result -->" + l(i));
                result += l(i);
            }
            Console.WriteLine("the sum is -->" + result);
        }


    }
}
