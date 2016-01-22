using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class Program
    {
     
        static void Main(string[] args)
        {
            MathsFunctions s = new MathsFunctions();
            
            Func<float, float>[] functions = { x => x + x, x => x * x + 3, x => x * x - 1, x => x * x };

            s.max(functions, 3);
            s.sum(x => x * x + 1, 2, 12);
            Console.ReadLine();
            

        }
       


    }

}

