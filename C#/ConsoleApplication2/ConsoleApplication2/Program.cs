using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Program
    {
        static void Main(string[] args)
        {
            Radom_Generator randomGenerator = new Radom_Generator();

            //----------FLOAT-------------
            /*
            create the float List
            */
            FilterableList<float> randomFloatList = new FilterableList<float>();
            FilterableList<float> roundedFloatList = new FilterableList<float>();
            FilterableList<float> evenNumberList = new FilterableList<float>();
            FilterableList<float> smallerThan5List = new FilterableList<float>();
            FilterableList<float> negativeNumberList = new FilterableList<float>();

            // This loop fills the list randomFloatList with random floats in the range 100 to -100 
            for (int i = 0; i < 10; i++)
            {
                randomFloatList.add(randomGenerator.randomFloat(-100, 100));
            }
            foreach (float zahl in randomFloatList)
            {
                float roundNumber = (float)Math.Round(zahl);
                roundedFloatList.add(roundNumber);

            }

            //with print the values of the list in other to discovert the values contain..
            Console.WriteLine("--Start of the random generated float list--");
            foreach (float e in randomFloatList)
            {
                Console.WriteLine(e);
            }
            Console.WriteLine("--End of the random Float list--\n");

            Console.WriteLine("--Starting round float numbers--");
            foreach (float e in roundedFloatList)
            {
                Console.WriteLine(e);
            }
            Console.WriteLine("--End of the rounded numbers--\n");


            // the lambda expressions
            foreach (float c in roundedFloatList)
            {
                evenNumberList = roundedFloatList.Filter((float item) => { return item % 2 == 0; });
            }

            foreach (float c in randomFloatList)
            {
                smallerThan5List = randomFloatList.Filter((float item) => { return item <= 5; });
            }

            foreach (float c in randomFloatList)
            {
                negativeNumberList = randomFloatList.Filter((float item) => { return item < 0; });
            }





            // print lists on the console.....
            Console.WriteLine("--Start filtering the even Numbers--");
            foreach (float h in evenNumberList)
            {
                Console.WriteLine(h);
            }
            Console.WriteLine("--End filtering the even Numbers--\n");

            Console.WriteLine("--Start filtering the Numbers smaller than 5--");
            foreach (float h in smallerThan5List)
            {
                Console.WriteLine(h);
            }
            Console.WriteLine("--End filtering the numbers smaller than 5--\n");

            Console.WriteLine("--Start filtering the negative numbers--");
            foreach (float h in negativeNumberList)
            {
                Console.WriteLine(h);
            }
            Console.WriteLine("--End filtering the negative numbers--\n");

            //****************************************


            //------------------String------------------------------------------
            /*
            creates the String list
            */
            FilterableList<String> randomStringList = new FilterableList<String>();
            FilterableList<String> stringsWithSList = new FilterableList<String>();
            FilterableList<String> stringsGreater3List = new FilterableList<String>();

            // This loop fills the list fl1 with random floats in the range 100 to -100 
            for (int i = 0; i < 10; i++)
            {
                randomStringList.add(randomGenerator.randomString(1, 10));
            }

            //with print the vlues of the list in other to discovert the values contain..
            Console.WriteLine("--Start of the random generated String list--");
            foreach (String e in randomStringList)
            {
                Console.WriteLine(e);
            }
            Console.WriteLine("--End of the random generated String list--\n");

            
            foreach (String c in randomStringList)
            {

                stringsWithSList = randomStringList.Filter((String item) => { return item.Contains("s"); });
            }

            Console.WriteLine("--Start filtering all Strings containing an 's'--");
            foreach (String h in stringsWithSList)
            {
                Console.WriteLine(h);
            }
            Console.WriteLine("--End filtering all Strings containing an 's'--\n");
            //****************************************

            foreach (String c in randomStringList)
            {

                stringsGreater3List = randomStringList.Filter((String item) => { return item.Length >= 3; });


            }


            Console.WriteLine("--Start filtering the Strings greater than 3--");
            foreach (String h in stringsGreater3List)
            {
                Console.WriteLine(h);
            }
            Console.WriteLine("--End filtering the Strings greater than 3--");

            Console.ReadLine();
        }
    }
}
