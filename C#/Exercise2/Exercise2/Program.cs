using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class Program
    {
        private static int x;

        public static int addToA(int a)
        {
            return a + 1;
        }

        static void Main(string[] args)
        {


            //  Func<float, float>[] functions = { f1,f2,f3 };
            Func<float, float>[] functions = { x => x + x, x => x * x + 3, x => x * x - 1, x => x * x };

            // Func<float, float>[] functions = { f1(float x){  return x + x; } };

            MathsFunctions s = new MathsFunctions();

            s.max(functions, 3);

            s.sum(x => x * x + 1, 2, 12);
            Console.ReadLine();

            //*------------------------------------------------------------

        }
        static int f1(int x) { return x + x; }


    }

}

