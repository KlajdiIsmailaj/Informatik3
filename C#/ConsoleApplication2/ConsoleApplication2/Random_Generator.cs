using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Radom_Generator
    {
        /*
        creates the random Objects
        */
        private Random r = new Random();

        /*
        the constructor for Random_Generator
        */
        public Radom_Generator()
        {

        }

        /*
         * returns a random float number
         * @param min is the minimum value for the generated random float
         * @param max is the maximum value for the generated random float
         * @param rand the generated value
         * @return rand the random float number
         */
        public float randomFloat(int min, int max)
        {
            float rand = r.Next(min, max);
            if (r.Next(0, 2) == 0)
            {
                rand += (float)r.NextDouble();
            }
            return rand;
        }

        /*
         * returns a random generated string
         * @param min the minimum length for the generated string
         * @param max the maximum length for the generated string
         * @param s the generated String
         * @return s is the random generated string
         */
        public string randomString(int minLength, int maxLength)
        {
            string s = "";
            for (int i = 0; i < r.Next(minLength, maxLength + 1); i++)
            {
                if (r.Next(0, 2) == 0)
                {
                    s += (char)r.Next(65, 91);
                }
                else
                {
                    s += (char)r.Next(97, 123);
                }
            }
            return s;
        }
    }
}
